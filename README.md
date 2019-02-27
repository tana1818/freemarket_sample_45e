# README

## ＜ユーザー系のテーブル＞

## users（ユーザーテーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|nickname|string|null: false|ニックネーム|
|email|string|null: false, unique: true|メールアドレス|
|password|string|null: false|パスワード（6〜128文字）|
|introduction|text|-------|自己紹介|
|uid|string|null: false|SNS認証用項目|
|provider|string|null: false|SNS認証用項目|
※SNS認証の参考URL：
https://qiita.com/kazuooooo/items/47e7d426cbb33355590e

### Association
- has_one :user_details
- has_one :deliveries
- has_one :cards


## user_details（ユーザー詳細テーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|sei|string|null: false|姓|
|mei|string|null: false|名|
|kana_sei|string|null: false|カナ姓|
|kana_mei|string|null: false|カナ名|
|birth|date|null: false|生年月日|
|auth_tel|integer|null: false|認証用携帯番号|
|zip_code|integer|-------|郵便番号|
|todofuken|string|-------|都道府県|
|shikutyoson|string|-------|市区町村|
|banchi|string|-------|番地|
|tatemono|string|-------|建物|
|image|string|-------|プロフィール画像|
|user_id|references|null: false,foreign_key: ture|users.id|

### Association
- belongs_to :user


## deliveries（発送元・届け先テーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|sei|string|null: false|姓|
|mei|string|null: false|名|
|kana_sei|string|null: false|カナ姓|
|kana_mei|string|null: false|カナ名|
|zip_code|integer|null: false|郵便番号|
|todofuken|string|null: false|都道府県|
|shikutyoson|string|null: false|市区町村|
|banchi|string|null: false|番地|
|tatemono|string|null: false|建物|
|tel|integer|null: false|電話番号|
|user_id|references|null: false,foreign_key: ture|users.id|

### Association
- belongs_to :user


## cards（クレジットカードテーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|card_number|integer|null: false|カード番号|
|expiration_month|integer|null: false|有効月|
|expiration_year|integer|null: false|有効年|
|security_code|integer|null: false|セキュリティコード|
|user_id|references|null: false,foreign_key: ture|users.id|

### Association
- belongs_to :user


## （都道府県テーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|name|string|null: false|都道府県名|

### Association




### ＜商品系のテーブル＞

## products（商品テーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|商品名product_name|string|null: false|
|説明description|TEXT|null: false|
|カテゴリー||null: false|
|商品の状態||null: false|
|配送料の負担||null: false|
|配送の方法||null: false|
|発送元の地域||null: false|
|発送までの日数||null: false|
|価格||null: false|
|出品ステータス||null: false|（出品中・取引中・売却済み・公開停止中）
|サイズ|||
|ブランド|||
|user_id|references|null: false,foreign_key: ture|users.id|


## 大カテゴリーテーブル
|Column|Type|Options|Note|
|------|----|-------|----|
|大カテゴリー名|||


## 中カテゴリーテーブル
|Column|Type|Options|Note|
|------|----|-------|----|
|中カテゴリー名|||


## カテゴリーテーブル
|Column|Type|Options|Note|
|------|----|-------|----|
|カテゴリー名|||
|大カテゴリ|||
|中カテゴリ|||
|サイズ種別|||（服・靴・キッズ服小・キッズ服大・キッズ靴・なし）
|ブランド有無|||（あり・なし）


## サイズテーブル
|Column|Type|Options|Note|
|------|----|-------|----|
|サイズ名|||
|サイズ種別|||（服・靴・キッズ服小・キッズ服大・キッズ靴・なし）


## 商品画像テーブル
|Column|Type|Options|Note|
|------|----|-------|----|
||||
||||


## 商品コメントテーブル
|Column|Type|Options|Note|
|------|----|-------|----|
||||
||||


## 商品購入テーブル
|Column|Type|Options|Note|
|------|----|-------|----|
||||
||||

## rate（評価テーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|user_id|string|null: false|評価したユーザーID|
|rate|string|null: false|評価|
|rated_user_id|null: false|string|評価されたユーザーID|
