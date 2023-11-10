class Admin::PostCommentsController < ApplicationController
 
 def show
    @post_comment = PostComment.find(params[:post_id])
 end
 
 def destroy
    PostComment.find(params[:id]).destroy
    redirect_to admin_post_path(params[:post_id])
 end
 
end
