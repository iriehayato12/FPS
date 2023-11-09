class Public::UsersController < ApplicationController
  #before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @categories = Category.all
  end

  def edit
    @user = User.find(params[:id])
    @categories = Category.all
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
       redirect_to user_path(current_user)
     else
       render "edit"
     end
  end
  
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
    @posts = Post.page(params[:page])
    @categories = Category.all
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  
  
end
