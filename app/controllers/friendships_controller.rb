class FriendshipsController < ApplicationController

  def show
    @accepted_friendships = Friendship.where(user_id: params[:id]).where(status: 1)
    @requested_friends = Friendship.where(user_id: params[:id]).where(status: 2)
    @friend_requests = Friendship.where(friend_id: params[:id]).where(status: 2)
    @user = User.find(params[:id])
  end

  # POST /friendships or /friendships.json
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id], status: 2)

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to root_url, notice: 'Friendship was successfully created.' }
        format.json { render :show, status: :created, location: @friendship }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @friendship = current_user.inverse_friendships.where(user_id: params[:user_id])
    respond_to do |format|
      if @friendship.first.update(status: 1)
        Friendship.create(user_id: @friendship.first.friend_id, friend_id: @friendship.first.user_id, status: 1)
        format.html { redirect_to root_url, notice: 'Accepted friend request.' }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1 or /friendships/1.json
  def destroy
    @friendship = current_user.friendships.where(friend_id: params[:friend_id])
    @friendship2 = current_user.inverse_friendships.where(user_id: params[:friend_id])
    unless @friendship.nil?
      @friendship.destroy(@friendship.first.id)
    end
    unless @friendship2.nil?
      @friendship2.destroy(@friendship2.first.id)
    end

    respond_to do |format|
      format.html { redirect_to friendship_path(id: params[:id]), notice: "Removed Friend" }
      format.json { head :no_content }
    end
  end
end
