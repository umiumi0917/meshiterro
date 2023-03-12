class UsersController < ApplicationController
   before_action :is_matching_login_user, only: [:edit, :update]
  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(paramns[:page])
  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to user_path(current_user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to post_images_path
    end
  end
end
