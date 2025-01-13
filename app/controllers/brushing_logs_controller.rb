class BrushingLogsController < ApplicationController
  before_action :authenticate_kid!

  def create
    @kid = Kid.find(params[:kid_id])
    @brushing_log = @kid.brushing_logs.build(brushing_log_params)
    @brushing_log.kid_nickname = @kid.nickname
    @brushing_log.date = Date.today
    @brushing_log.time_of_day = Time.current.strftime("%H:%M")

    if @brushing_log.save
      update_virus_count(@kid)
      redirect_to kid_path(@kid)
    else
      render :new
    end
  end

  private

  def brushing_log_params
    params.require(:brushing_log).permit(:brushed_at, :kid_id, :image, :icon_type)
  end

  def update_virus_count(kid)
    if kid.daily_login_count.present? && kid.daily_login_count > 0
      kid.decrement!(:daily_login_count)
      puts "ウイルスカウントを減少 -> 新しいカウント: #{kid.daily_login_count}"
    else
      kid.update(daily_login_count: 0)
      puts "ウイルスカウントをリセットしました"
    end
  end
end
