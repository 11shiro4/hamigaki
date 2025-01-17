class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :nickname, :age ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :nickname, :age ])
  end

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end
end
