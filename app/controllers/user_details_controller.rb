class UserDetailsController < ApplicationController

  def index  #本人確認ページ。
    @user = User.find(current_user.id)
  end

end
