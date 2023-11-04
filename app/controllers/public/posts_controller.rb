class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.page(params[:page])
  end
  
  def edit
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
     flash[:notice] = "You have created book successfully"
     redirect_to post_path(@post)
    else
    @posts = Post.all
    @user = User.find(current_user.id)
    render :index
    end
  end

  def update
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
  
end
