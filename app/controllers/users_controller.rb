class UsersController < ApplicationController

  def create
  end

  def show
  end

  def selling
    @user = User.find(params[:id])
    @other_user_products = Product.where(user_id: 1).order("id DESC").limit(6)
  end

end
