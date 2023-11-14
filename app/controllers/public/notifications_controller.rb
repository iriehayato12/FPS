class Public::NotificationsController < ApplicationController
 def index
    @notifications = current_user.notifications.order(created_at: :desc).page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
    @categories = Category.all
 end

 def destroy
    @notifications = current_end_user.notifications.destroy_all
    redirect_to notifications_path
 end
end