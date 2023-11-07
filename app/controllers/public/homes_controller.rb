class Public::HomesController < ApplicationController
    
def top
 @user = current_user
 @posts = Post.page(params[:page])
 @categories = Category.all
end

def about
 @categories = Category.all
end

end
