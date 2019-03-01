# README

〜ユーザー系のテーブル〜

## 会員テーブル :users
|Column|Type|Options|
|------|----|-------|
<<<<<<< HEAD
|ニックネームnickname|string|null: false, index: true|
|メールアドレスemail|string|null: false|
=======
|ニックネームnickname|||
|メールアドレスemail|||
>>>>>>> kozitex/Database-definition
|パスワードpassword||6〜128文字|


## 本人確認テーブル
|Column|Type|Options|
|------|----|-------|
<<<<<<< HEAD
|姓sei|string|null: false|
|名mei|string|null: false|
|カナ姓kana_sei|string|null: false|
=======
|姓sei|||
|名mei|||
|カナ姓kana_sei|||
>>>>>>> kozitex/Database-definition
|カナ名kana_mei|||
|生年月日birth|||


## ？？？
|Column|Type|Options|
|------|----|-------|
|認証用携帯番号auth_tel|||


## 発送元・届け先テーブル
|Column|Type|Options|
|------|----|-------|
|姓sei|||
|名mei|||
|カナ姓kana_sei|||
|カナ名kana_mei|||
|郵便番号zip_code|||
|都道府県todofuken|||
|市区町村shikuchoson|||
|番地banchi|||
|建物tatemono|||
|電話番号tel|||


## 支払テーブル
|Column|Type|Options|
|------|----|-------|
|カード番号creca_num|||
|有効月expir_month|||
|有効年expir_year|||
|セキュリティコードsecu_code|||
<<<<<<< HEAD

## ？？？
|Column|Type|Options|
|------|----|-------|
|自己紹介introduction|TEXT||


## SNS認証テーブル（参考：https://qiita.com/kazuooooo/items/47e7d426cbb33355590e）
|Column|Type|Options|
|------|----|-------|
|uid|||
|provider|||


〜商品系のテーブル〜

## 商品テーブル :products
|Column|Type|Options|
|------|----|-------|
|商品名product_name|||
|説明description|TEXT||
|カテゴリー|||
|商品の状態|||
|配送料の負担|||
|配送の方法|||
|発送元の地域|||
|発送までの日数|||
|価格|||
|出品ステータス|||（出品中・取引中・売却済み・公開停止中）
|サイズ|||
|ブランド|||


## 大カテゴリーテーブル
|Column|Type|Options|
|------|----|-------|
|大カテゴリー名|||


## 中カテゴリーテーブル
|Column|Type|Options|
|------|----|-------|
|中カテゴリー名|||


## カテゴリーテーブル
|Column|Type|Options|
|------|----|-------|
|カテゴリー名|||
|大カテゴリ|||
|中カテゴリ|||
|サイズ種別|||（服・靴・キッズ服小・キッズ服大・キッズ靴・なし）
|ブランド有無|||（あり・なし）


## サイズテーブル
|Column|Type|Options|
|------|----|-------|
|サイズ名|||
|サイズ種別|||（服・靴・キッズ服小・キッズ服大・キッズ靴・なし）


## 商品画像テーブル
|Column|Type|Options|
|------|----|-------|
||||
||||


## 商品コメントテーブル
|Column|Type|Options|
|------|----|-------|
||||
||||


## 商品購入テーブル
|Column|Type|Options|
|------|----|-------|
||||
||||
=======

## ？？？
|Column|Type|Options|
|------|----|-------|
|自己紹介introduction|TEXT||


## SNS認証テーブル（参考：https://qiita.com/kazuooooo/items/47e7d426cbb33355590e）
|Column|Type|Options|
|------|----|-------|
|uid|||
|provider|||


〜商品系のテーブル〜

## 商品テーブル :products
|Column|Type|Options|
|------|----|-------|
|商品名product_name|||
|説明description|TEXT||
|カテゴリー|||
|商品の状態|||
|配送料の負担|||
|配送の方法|||
|発送元の地域|||
|発送までの日数|||
|価格|||
|出品ステータス|||（出品中・取引中・売却済み・公開停止中）
|サイズ|||
|ブランド|||


## 大カテゴリーテーブル
|Column|Type|Options|
|------|----|-------|
|大カテゴリー名|||


## 中カテゴリーテーブル
|Column|Type|Options|
|------|----|-------|
|中カテゴリー名|||


## カテゴリーテーブル
|Column|Type|Options|
|------|----|-------|
|カテゴリー名|||
|大カテゴリ|||
|中カテゴリ|||
|サイズ種別|||（服・靴・キッズ服小・キッズ服大・キッズ靴・なし）
|ブランド有無|||（あり・なし）


## サイズテーブル
|Column|Type|Options|
|------|----|-------|
|サイズ名|||
|サイズ種別|||（服・靴・キッズ服小・キッズ服大・キッズ靴・なし）


## 商品画像テーブル
|Column|Type|Options|
|------|----|-------|
||||
||||


## 商品コメントテーブル
|Column|Type|Options|
|------|----|-------|
||||
||||


## 商品購入テーブル
|Column|Type|Options|
|------|----|-------|
||||
||||

>>>>>>> kozitex/Database-definition
