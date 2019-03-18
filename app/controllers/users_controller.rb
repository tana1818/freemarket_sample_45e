class UsersController < ApplicationController


  def create
  end
  
  def new
    @user = User.find(current_user.id)
  end

  def show
  end

  def selling
    @user = User.find(params[:id])
    @other_user_products = Product.where(user_id: 1).order("id DESC").limit(6)
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

end
