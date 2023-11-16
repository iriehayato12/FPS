class Admin::UsersController < ApplicationController
   before_action :authenticate_admin!
   
  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @categories = Category.all
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end
  
  def user_params
    params.require(:user).permit(:is_active)
  end
end
