class UsersController < ApplicationController

  def new
    @user = User.find(current_user.id)
  end

  def create
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
