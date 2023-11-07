class Public::SearchesController < ApplicationController
 
 def search_category
     @category_id = params[:category_id]
     @posts = Post.where(category_id: @category_id).page(params[:page])
     @categories = Category.all
 end
end
