class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.page(params[:page])
    @categories = Category.all
  end
  
  def edit
    @post = Post.find(params[:id])
    @user = User.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @categories = Category.all
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
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
