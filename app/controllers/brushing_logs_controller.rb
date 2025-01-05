class BrushingLogsController < ApplicationController
  before_action :authenticate_kid!

  def index
    @brushing_logs = BrushingLog.all
  end

  def show
    @brushing_log = BrushingLog.find(params[:id])
  end

  def new
    @brushing_log = BrushingLog.new
  end

  def create
    @brushing_log = BrushingLog.new(brushing_log_params)
    if @brushing_log.save
      redirect_to @brushing_log
    else
      render :new
    end
  end

  def edit
    @brushing_log = BrushingLog.find(params[:id])
  end

  def update
    @brushing_log = BrushingLog.find(params[:id])
    if @brushing_log.update(brushing_log_params)
      redirect_to @brushing_log
    else
      render :edit
    end
  end

  def destroy
    @brushing_log = BrushingLog.find(params[:id])
    @brushing_log.destroy
    redirect_to brushing_logs_path
  end

  private

  def brushing_log_params
    params.require(:brushing_log).permit(:kid_nickname, :date, :time_of_day)
  end
end
