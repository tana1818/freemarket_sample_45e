# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

Category.create(name: 'レディース', sort_by: 1)
Category.create(name: 'メンズ', sort_by: 2)
Category.create(name: 'ベビー・キッズ', sort_by: 3)
Category.create(name: 'インテリア・住まい・小物', sort_by: 4)
Category.create(name: '本・音楽・ゲーム', sort_by: 5)
Category.create(name: 'おもちゃ・ホビー・グッズ', sort_by: 6)
Category.create(name: 'コスメ・香水・美容', sort_by: 7)
Category.create(name: '家電・スマホ・カメラ', sort_by: 8)
Category.create(name: 'スポーツ・レジャー', sort_by: 9)
Category.create(name: 'ハンドメイド', sort_by: 10)
Category.create(name: 'チケット', sort_by: 11)
Category.create(name: '自動車・オートバイ', sort_by: 12)
Category.create(name: 'その他', sort_by: 13)

Category.create(name: 'トップス', division: 1, sort_by: 14)
Category.create(name: 'ジャケット/アウター', division: 1, sort_by: 15)
Category.create(name: 'パンツ', division: 1, sort_by: 16)
Category.create(name: 'スカート', division: 1, sort_by: 17)
Category.create(name: 'ワンピース', division: 1, sort_by: 18)
Category.create(name: '靴', division: 1, sort_by: 19)
Category.create(name: 'ルームウェア/パジャマ', division: 1, sort_by: 20)
Category.create(name: 'レッグウェア', division: 1, sort_by: 21)
Category.create(name: '帽子', division: 1, sort_by: 22)
Category.create(name: 'バッグ', division: 1, sort_by: 23)
Category.create(name: 'アクセサリー', division: 1, sort_by: 24)
Category.create(name: 'ヘアアクセサリー', division: 1, sort_by: 25)
Category.create(name: '小物', division: 1, sort_by: 26)
Category.create(name: '時計', division: 1, sort_by: 27)
Category.create(name: 'ウィッグ/エクステ', division: 1, sort_by: 28)
Category.create(name: '浴衣/水着', division: 1, sort_by: 29)
Category.create(name: 'スーツ/フォーマル/ドレス', division: 1, sort_by: 30)
Category.create(name: 'マタニティ', division: 1, sort_by: 31)
Category.create(name: 'その他', division: 1, sort_by: 32)

Category.create(name: 'Tシャツ/カットソー(半袖/袖なし)', division: 14, sort_by: 119, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'Tシャツ/カットソー(七分/長袖)', division: 14, sort_by: 120, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'シャツ/ブラウス(半袖/袖なし)', division: 14, sort_by: 121, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'シャツ/ブラウス(七分/長袖)', division: 14, sort_by: 122, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'ポロシャツ', division: 14, sort_by: 123, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'キャミソール', division: 14, sort_by: 124, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'タンクトップ', division: 14, sort_by: 125, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'ホルターネック', division: 14, sort_by: 126, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'ニット/セーター', division: 14, sort_by: 127, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'チュニック', division: 14, sort_by: 128, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'カーディガン/ボレロ', division: 14, sort_by: 129, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'アンサンブル', division: 14, sort_by: 130, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'ベスト/ジレ', division: 14, sort_by: 131, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'パーカー', division: 14, sort_by: 132, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'トレーナー/スウェット', division: 14, sort_by: 133, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'ベアトップ/チューブトップ', division: 14, sort_by: 134, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'ジャージ', division: 14, sort_by: 135, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'その他', division: 14, sort_by: 136, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'ミニスカート', division: 17, sort_by: 167, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'ひざ丈スカート', division: 17, sort_by: 168, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'ロングスカート', division: 17, sort_by: 169, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'キュロット', division: 17, sort_by: 170, size_kind_id: 1, is_brand_presence: 1)
Category.create(name: 'その他', division: 17, sort_by: 171, size_kind_id: 1, is_brand_presence: 1)

SizeKind.create(name: '服')

Size.create(name: 'XXS以下', sort_by: 1, size_kind_id: 1)
Size.create(name: 'XS(SS)', sort_by: 2, size_kind_id: 1)
Size.create(name: 'S', sort_by: 3, size_kind_id: 1)
Size.create(name: 'M', sort_by: 4, size_kind_id: 1)
Size.create(name: 'L', sort_by: 5, size_kind_id: 1)
Size.create(name: 'XL(LL)', sort_by: 6, size_kind_id: 1)
Size.create(name: '2XL(3L)', sort_by: 7, size_kind_id: 1)
Size.create(name: '3XL(4L)', sort_by: 8, size_kind_id: 1)
Size.create(name: '4XL(5L)以上', sort_by: 9, size_kind_id: 1)
Size.create(name: 'FREE SIZE', sort_by: 10, size_kind_id: 1)

Condition.create(name: '新品、未使用', sort_by: 1)
Condition.create(name: '未使用に近い', sort_by: 2)
Condition.create(name: '目立った傷や汚れなし', sort_by: 3)
Condition.create(name: 'やや傷や汚れあり', sort_by: 4)
Condition.create(name: '傷や汚れあり', sort_by: 5)
Condition.create(name: '全体的に状態が悪い', sort_by: 6)

DeliveryFeePay.create(name: '着払い(購入者負担)', sort_by: 2)
DeliveryFeePay.create(name: '送料込み(出品者負担)', sort_by: 1)

DeliveryMethod.create(name: '未定', sort_by: 1)
DeliveryMethod.create(name: 'ゆうメール', sort_by: 3)
DeliveryMethod.create(name: 'ゆうパケット', sort_by: 9)
DeliveryMethod.create(name: 'レターパック', sort_by: 4)
DeliveryMethod.create(name: '普通郵便(定形、定形外)', sort_by: 5)
DeliveryMethod.create(name: 'クロネコヤマト', sort_by: 6)
DeliveryMethod.create(name: 'ゆうパック', sort_by: 7)
DeliveryMethod.create(name: 'クリックポスト', sort_by: 8)
DeliveryMethod.create(name: 'らくらくメルカリ便', sort_by: 2)

ShipmentPeriod.create(name: '1~2日で発送', sort_by: 1)
ShipmentPeriod.create(name: '2~3日で発送', sort_by: 2)
ShipmentPeriod.create(name: '4~7日で発送', sort_by: 3)

User.create(nickname: 'テスト1', sei: 'テ', mei: 'スト1', kana_sei: 'テ', kana_mei: 'スト1', birth: '2019/3/11', email: 'test1@test.com', password: 'passw0rd')
User.create(nickname: 'テスト2', sei: 'テ', mei: 'スト2', kana_sei: 'テ', kana_mei: 'スト2', birth: '2019/3/11', email: 'test2@test.com', password: 'passw0rd')

# Product.create(name: 'ナイキのTシャツ', description: 'かっこいい', large_category: 'メンズ', middle_category: 'トップス', small_category: 'Tシャツ/カットソー(半袖/袖なし)', condition_id: 1, delivery_fee_pay_id: 1, delivery_method_id: 1, prefecture_id: 1, shipment_period_id: 1, price: 500, status: "売り出し中", size_id: 1, brand: "NIKE", images: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGOPQc2fx8POUZvhJ6eg6dUksVq2zUlFoP3RibhVAkK0PwVYP3", user_id: 1)
