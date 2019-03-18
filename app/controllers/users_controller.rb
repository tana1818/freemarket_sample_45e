class UsersController < ApplicationController


  def create
  end

  def new
    @user = User.find(params[:id])
  end

  def selling
    @user = User.find(params[:id])
    @other_user_products = Product.where(user_id: 1).order("id DESC").limit(6)
  end

  def show
    @user = User.find(params[:id])
  end

  def credit
    @user = User.find(params[:id])
  end

  def credit_create
    @user = User.find(params[:id])
  end

  def logout
    @user = User.find(params[:id])
  end

  def profile
    @user = User.find(params[:id])
  end

end
