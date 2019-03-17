class UserDetailsController < ApplicationController

  def index  #本人確認ページ。仮で作成中。
    @user = User.find(1)
  end

end
