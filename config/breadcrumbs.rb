crumb :root do
  link "メルカリ", root_path
end

crumb :user do |user|
  link "マイページ", user_path(user)
end

crumb :profile do |user|
  link "プロフィール"
  parent :user, user
end

crumb :user_details do |user|
  link "本人情報の登録", user_detail_path
  parent :user, user
end

crumb :logout do |user|
  link "ログアウト"
  parent :user, user
end

crumb :credit do |user|
  link "支払い方法", credit_user_path
  parent :user, user
end

crumb :credit_create do |user|
  link "クレジットカード情報入力"
  parent :credit, user
end

crumb :product do |product|
  link "#{product.name}"
end
