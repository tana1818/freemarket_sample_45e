# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def sns
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password],
      )
  end

  def create
    Payjp.api_key = 'sk_test_eb4453d310b2f6b4f2c6f649'
    customer = Payjp::Customer.create(
     card: params[:user][:payjptoken]
    )
    params[:user][:payjptoken] = customer.id
    super
    @user.uid = session[:uid]
    @user.provider = session[:provider]
    @user.save
  end

end
