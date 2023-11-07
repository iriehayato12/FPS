class Admin::UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @categories = Category.all
  end

  def edit
  end

  def update
  end
end
