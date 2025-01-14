class Kids::SessionsController < Devise::SessionsController
  def create
    super
    update_login_count
  end

  private

  def update_login_count
    if current_kid.login_at.present? && current_kid.login_at.to_date != Date.today
      current_kid.update(daily_login_count: 3, login_at: Time.current)
      puts "日付変更 -> カウントリセット: #{current_kid.daily_login_count}"
    end
  end
end
