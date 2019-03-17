class UsersController < ApplicationController

  def new # 仮のidで作成中
    @user = User.find(params[:id])
  end

  def create
  end

  def show # 仮のidで作成中
    @user = User.find(params[:id])
  end

  def credit # 仮のidで作成中
    @user = User.find(params[:id])
  end

  def credit_create # 仮のidで作成中
    @user = User.find(params[:id])
  end

  def logout # 仮のidで作成中
    @user = User.find(params[:id])
  end

end
