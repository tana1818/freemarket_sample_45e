# README

![freemarket_ER図3 10](https://user-images.githubusercontent.com/47135669/54096018-54c4bb00-43ed-11e9-8448-3d591724accc.png)

# ＜ユーザー系のテーブル＞

## users（ユーザーテーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|nickname|string|null: false|ニックネーム|
|email|string|null: false, unique: true|メールアドレス|
|password|string|null: false|パスワード（6〜128文字）|
|introduction|text|-------|自己紹介|
|uid|string|-------|SNS認証用項目|
|provider|string|-------|SNS認証用項目|
|sei|string|null: false|姓|
|mei|string|null: false|名|
|kana_sei|string|null: false|カナ姓|
|kana_mei|string|null: false|カナ名|
|birth|date|null: false|生年月日|

※SNS認証の参考URL：
https://qiita.com/kazuooooo/items/47e7d426cbb33355590e

### Association
- has_one :user_detail
- has_one :delivery
- has_one :card
- has_many :products
- has_many :comments
- has_many :likes
- has_many :purchases
- has_many :rates


## user_details（ユーザー詳細テーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|auth_tel|integer|null: false|認証用携帯番号|
|zip_code|integer|-------|郵便番号|
|todofuken|string|-------|都道府県|
|shikutyoson|string|-------|市区町村|
|banchi|string|-------|番地|
|tatemono|string|-------|建物|
|image|string|-------|プロフィール画像|
|user_id|references|null: false,foreign_key: true|ユーザーID／users.id|

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
|user_id|references|null: false,foreign_key: true|ユーザーID／users.id|

### Association
- belongs_to :user
- has_many :purchases


## cards（クレジットカードテーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|card_number|integer|null: false|カード番号|
|expiration_month|integer|null: false|有効月|
|expiration_year|integer|null: false|有効年|
|security_code|integer|null: false|セキュリティコード|
|user_id|references|null: false,foreign_key: true|ユーザーID／users.id|

### Association
- belongs_to :user
- has_many :purchases


# ＜商品系のテーブル＞

## products（商品テーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|name|string|null: false|商品名（1〜40文字）|
|description|text|null: false|商品説明（1〜1000文字）|
|large_category|integer|null: false|大カテゴリー／categories.id|
|middle_category|integer|null: false|中カテゴリー／categories.id|
|small_category|integer|null: false|小カテゴリー／categories.id|
|condition|references|null: false,foreign_key: true|商品の状態／conditions.id|
|delivery_fee_pay|references|null: false,foreign_key: true|配送料の負担／delivery_fee_pays.id|
|delivery_method|references|null: false,foreign_key: true|配送の方法／delivery_methods.id|
|prefecture_id|integer|null: false|発送元の地域／prefectures.id|
|shipment_period|references|null: false,foreign_key: true|発送までの日数／shipment_periods.id|
|price|integer|null: false|価格（300〜9999999）|
|status|string|null: false|出品ステータス（出品停止中・出品中・取引中・売却済み）|
|size|references|null: false,foreign_key: true|サイズ／sizes.id／categories.size_kind_idがnullでなければ必須|
|brand|string|-------|ブランド名|
|user|references|null: false,foreign_key: true|ユーザーID／users.id|

### Association
- belongs_to :condition
- belongs_to :delivery_fee_pay
- belongs_to :delivery_method
- belongs_to :shipment_period
- belongs_to :size
- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :purchases


## categories（カテゴリーテーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|name|string|null: false|カテゴリー名
|division|integer|-------|区分|
|sort_by|integer|null: false|並び順|
|size_kind_id|integer|-------|サイズ種別|
|is_brand_presence|integer|-------|ブランド有無|

### Association



## sizes（サイズテーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|name|string|null: false|サイズ名|
|sort_by|integer|null: false|並び順|
|size_kind_id|integer|-------|サイズ種別|

### Association
- has_many :products
- belongs_to :size_kind


## size_kinds（サイズ種別テーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|name|string|null: false|サイズ種別名（服・靴・キッズ服小・キッズ服大・キッズ靴）|

### Association
- has_many :sizes


## conditions（商品の状態テーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|name|string|null: false|状態名|
|sort_by|integer|null: false|並び順|

### Association
- has_many :products


## delivery_fee_pays（配送料の負担テーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|name|string|null: false|配送料の負担名|
|sort_by|integer|null: false|並び順|

### Association
- has_many :products


## delivery_methods（配送の方法テーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|name|string|null: false|配送の方法名|
|sort_by|integer|null: false|並び順|

### Association
- has_many :products


## shipment_periods（発送までの日数テーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|name|string|null: false|発送までの日数名|
|sort_by|integer|null: false|並び順|

### Association
- has_many :products


## comments（商品コメントテーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|comment|text|null: false|商品コメント|
|product_id|references|null: false,foreign_key: true|商品ID／products.id|
|user_id|references|null: false,foreign_key: true|ユーザーID／users.id|

### Association
- belongs_to :product
- belongs_to :user


## likes（いいねテーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|product_id|references|null: false,foreign_key: true|商品ID／products.id|
|user_id|references|null: false,foreign_key: true|ユーザーID／users.id|

### Association
- belongs_to :product
- belongs_to :user


## purchases（商品購入テーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|payment|integer|null: false|支払い金額|
|delivery_id|references|null: false,foreign_key: true|届け先ID／deliveries.id|
|card_id|references|null: false,foreign_key: true|クレジットカードID／cards.id|
|product_id|references|null: false,foreign_key: true|商品ID／products.id|
|user_id|references|null: false,foreign_key: true|購入ユーザーID／users.id|

### Association
- belongs_to :delivery
- belongs_to :card
- belongs_to :product
- belongs_to :user
- has_many :rates


## rates（評価テーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|rating_type|string|null: false|評価区分（受取評価・購入者評価）|
|reputation_id|references|null: false,foreign_key: true|評点ID／scores.id|
|comment|text|null: false|評価コメント|
|purchase_id|references|null: false,foreign_key: true|商品購入ID／purchases.id|
|user_id|references|null: false,foreign_key: true|被評価ユーザーID／users.id|

### Association
- belongs_to :score
- belongs_to :purchase
- belongs_to :user


## reputations（評点テーブル）
|Column|Type|Options|Note|
|------|----|-------|----|
|score|string|null: false|評点名（良い・普通・悪い）|

### Association
- has_many :rates
