class BrushingLogsController < ApplicationController
  before_action :authenticate_kid!

  def index
    @brushing_logs = BrushingLog.all
  end

  def show
    @brushing_log = BrushingLog.find(params[:kid_id])
  end

  def new
    @brushing_log = BrushingLog.new
  end

  def create
    @kid = Kid.find(params[:kid_id])  # Kidを取得
    @brushing_log = @kid.brushing_logs.build(brushing_log_params)
    @brushing_log.kid_nickname = @kid.nickname
    @brushing_log.date = Date.today
    @brushing_log.time_of_day = Time.current.strftime("%H:%M")

    if @brushing_log.save
      redirect_to kid_path(@kid)
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
    params.require(:brushing_log).permit(:brushed_at, :kid_id)
  end
end
