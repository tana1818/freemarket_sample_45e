class UsersController < ApplicationController

  def new
    @user = User.find(params[:id])
  end

  def create
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

end
