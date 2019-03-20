class UsersController < ApplicationController


  def create
  end

  def new
    @user = User.find(current_user.id)
  end

  def selling
    @user = User.find(params[:id])
    @current_user_products = Product.where(user_id: current_user.id).order("id DESC").limit(6)
  end

  def show
    @user = User.find(current_user.id)
  end

  def credit
    @user = User.find(current_user.id)
  end

  def credit_create
    @user = User.find(current_user.id)
  end

  def logout
    @user = User.find(current_user.id)
  end

  def profile
    @user = User.find(params[:id])
  end

  def signup
  end

end
