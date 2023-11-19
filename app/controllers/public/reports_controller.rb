class Public::ReportsController < ApplicationController
 
 def new
  @report = Report.new
  @user = User.find(params[:user_id])
  @categories = Category.all
 end
 
 def create
  @categories = Category.all
  @user = User.find(params[:user_id])
  @report = Report.new(report_params)
  @report.reporter_id = current_user.id
  @report.reported_id = @user.id
  if @report.save
   redirect_to user_path(@user), notice: "ご報告ありがとうございます"
  else
   render "new"
  end
 end
  
  private
  
  def report_params
   params.require(:report).permit(:reason, :url, :status)
  end
  
end
