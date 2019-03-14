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

ActiveRecord::Schema.define(version: 2019_03_06_070139) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "division"
    t.integer "sort_by", null: false
    t.integer "size_kind_id"
    t.integer "is_brand_presence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "sort_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "large_category", null: false
    t.integer "middle_category", null: false
    t.integer "small_category", null: false
    t.bigint "condition_id", null: false
    t.bigint "delivery_fee_pay_id", null: false
    t.bigint "delivery_method_id", null: false
    t.integer "prefecture_id", null: false
    t.bigint "shipment_period_id", null: false
    t.integer "price", null: false
    t.string "status", null: false
    t.bigint "size_id", null: false
    t.string "brand"
    t.string "images", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condition_id"], name: "index_products_on_condition_id"
    t.index ["delivery_fee_pay_id"], name: "index_products_on_delivery_fee_pay_id"
    t.index ["delivery_method_id"], name: "index_products_on_delivery_method_id"
    t.index ["shipment_period_id"], name: "index_products_on_shipment_period_id"
    t.index ["size_id"], name: "index_products_on_size_id"
    t.index ["user_id"], name: "index_products_on_user_id"
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
    t.integer "size_kind_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.text "introduction"
    t.string "uid"
    t.string "provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "products", "conditions"
  add_foreign_key "products", "delivery_fee_pays"
  add_foreign_key "products", "delivery_methods"
  add_foreign_key "products", "shipment_periods"
  add_foreign_key "products", "sizes"
  add_foreign_key "products", "users"
end
