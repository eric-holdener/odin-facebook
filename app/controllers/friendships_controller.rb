class FriendshipsController < ApplicationController

  def show
    @friendships = Friendship.where(user_id: params[:id]).all
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
    respond_to do |format|
      if @friendship.update(status: 1)
        Friendship.create(user_id: @friendship.friend_id, friend_id: @friendship.user_id, status: 1)
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
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: "Removed Friend" }
      format.json { head :no_content }
    end
  end
end
