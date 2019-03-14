# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_07_045805) do

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "card_number", null: false
    t.integer "expiration_month", null: false
    t.integer "expiration_year", null: false
    t.integer "security_code", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "sort_by", null: false
    t.integer "is_brand_presence"
    t.bigint "size_kind_id"
    t.bigint "large_category_id", null: false
    t.bigint "middle_category_id", null: false
    t.bigint "small_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["large_category_id"], name: "index_categories_on_large_category_id"
    t.index ["middle_category_id"], name: "index_categories_on_middle_category_id"
    t.index ["size_kind_id"], name: "index_categories_on_size_kind_id"
    t.index ["small_category_id"], name: "index_categories_on_small_category_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "comment", null: false
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_comments_on_product_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "sort_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sei", null: false
    t.string "mei", null: false
    t.string "kana_sei", null: false
    t.string "kana_mei", null: false
    t.string "zip_code", null: false
    t.string "shikutyoson", null: false
    t.string "banchi", null: false
    t.string "tatemono"
    t.integer "tel"
    t.bigint "user_id"
    t.integer "prefecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_deliveries_on_user_id"
  end

  create_table "delivery_fee_pays", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "sort_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_methods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "sort_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "large_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "sort_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_likes_on_product_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "middle_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "sort_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "is_hidden"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "text", null: false
    t.integer "price", null: false
    t.string "status", null: false
    t.string "brand", null: false
    t.bigint "category_id", null: false
    t.bigint "condition_id", null: false
    t.bigint "delivery_id", null: false
    t.bigint "prefecture_id", null: false
    t.bigint "shipment_period_id", null: false
    t.bigint "delivery_method_id", null: false
    t.bigint "size_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["condition_id"], name: "index_products_on_condition_id"
    t.index ["delivery_id"], name: "index_products_on_delivery_id"
    t.index ["delivery_method_id"], name: "index_products_on_delivery_method_id"
    t.index ["prefecture_id"], name: "index_products_on_prefecture_id"
    t.index ["shipment_period_id"], name: "index_products_on_shipment_period_id"
    t.index ["size_id"], name: "index_products_on_size_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "purchases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "rating_type", null: false
    t.text "comment", null: false
    t.bigint "reputation_id", null: false
    t.bigint "purchase_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_id"], name: "index_rates_on_purchase_id"
    t.index ["reputation_id"], name: "index_rates_on_reputation_id"
    t.index ["user_id"], name: "index_rates_on_user_id"
  end

  create_table "reputations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "score"
  end

  create_table "shipment_periods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "sort_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "size_kinds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "sort_by", null: false
    t.bigint "size_kind_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["size_kind_id"], name: "index_sizes_on_size_kind_id"
  end

  create_table "small_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "sort_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "auth_tel", null: false
    t.integer "zip_code"
    t.string "shikutyoson"
    t.string "banchi"
    t.string "tatemono"
    t.string "avater_image"
    t.bigint "user_id"
    t.bigint "prefecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_user_details_on_prefecture_id"
    t.index ["user_id"], name: "index_user_details_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.text "introduction"
    t.string "uid"
    t.string "provider"
    t.string "sei", null: false
    t.string "mei", null: false
    t.string "kana_sei", null: false
    t.string "kana_mei", null: false
    t.date "birth", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cards", "users"
  add_foreign_key "categories", "large_categories"
  add_foreign_key "categories", "middle_categories"
  add_foreign_key "categories", "small_categories"
  add_foreign_key "comments", "products"
  add_foreign_key "comments", "users"
  add_foreign_key "deliveries", "users"
  add_foreign_key "likes", "products"
  add_foreign_key "likes", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "conditions"
  add_foreign_key "products", "deliveries"
  add_foreign_key "products", "delivery_methods"
  add_foreign_key "products", "prefectures"
  add_foreign_key "products", "shipment_periods"
  add_foreign_key "products", "sizes"
  add_foreign_key "products", "users"
  add_foreign_key "rates", "purchases"
  add_foreign_key "rates", "reputations"
  add_foreign_key "rates", "users"
  add_foreign_key "user_details", "prefectures"
  add_foreign_key "user_details", "users"
end
