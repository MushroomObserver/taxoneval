class ReportController < ApplicationController
  def index
    @title = t(:report_index_title)
  end
  
  def show
    redirect_to(action: 'index') if params[:id].nil?
  end
end
