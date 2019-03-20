class UserDetailsController < ApplicationController

  def show  #本人確認ページ。
    @user = User.find(params[:id])
  end

end
