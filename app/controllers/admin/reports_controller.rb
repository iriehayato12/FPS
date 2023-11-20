class Admin::ReportsController < ApplicationController
 
 def index
  @reports = Report.page(params[:page])
 end
 
 def show
  @report = Report.find(params[:id])
  @reports = Report.page(params[:page])
 end
 
 def update
  @report = Report.find(params[:id])
   if @report.update(report_params)
      flash[:notice] = "※対応ステータスを更新しました"
      redirect_to admin_report_path(@report)
   else
      render "show"
   end
 end
 
 private
 
 def report_params
  params.require(:report).permit(:status)
 end
end
