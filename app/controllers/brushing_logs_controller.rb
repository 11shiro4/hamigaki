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

  def destroy
    @brushing_log = BrushingLog.find(params[:id])
    @brushing_log.destroy
    redirect_to kid_path(current_kid), notice: "\u8A18\u9332\u304C\u524A\u9664\u3055\u308C\u307E\u3057\u305F\u3002"
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
