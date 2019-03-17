class UserDetailsController < ApplicationController

  def index  #本人確認ページ。
    @user = User.find(params[:id])
  end

end
