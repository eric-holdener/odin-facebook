class ProfilesController < ApplicationController
  def index
    @users = User.all
    @friends = Friendship.where(user_id: current_user.friend_ids).where(status: 1)
  end

  # GET /reactions/1 or /reactions/1.json
  def show
    @user = User.find(params[:id])
    @friends = Friendship.where(user_id: @user.friend_ids).where(status: 1)
    @posts = Post.where(user_id: @user.id).includes(:comments)
  end

  def delete_image
    @image = ActiveStorage::Attachment.find(params[:image_id])
    if current_user == @image.record
      @image.purge
      redirect_back(fallback_location: request.referer)
    else
      redirect_to current_user, notice: "You cannot delete that image"
    end
  end
end