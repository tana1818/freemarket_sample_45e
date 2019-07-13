class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index, :signup, :show, :search]
  before_action :authenticate_with_http_digest
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname,:sei,:mei,:kana_sei,:kana_mei,:birth,:payjptoken,deliverie_attributes: [:sei,:mei,:kana_sei,:kana_mei,:zip_code,:prefecture_id,:shikutyoson,:banchi,:tatemono,:tel],user_detail_attributes: [:auth_tel]])
  end

end
