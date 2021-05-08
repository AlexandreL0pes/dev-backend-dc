# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_08_142307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "state_id", null: false
    t.string "country"
    t.string "city"
    t.string "district"
    t.string "street"
    t.string "complement"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "postal_code"
    t.string "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_addresses_on_order_id"
    t.index ["state_id"], name: "index_addresses_on_state_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "external_code"
    t.string "name"
    t.string "email"
    t.string "contact"
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_customers_on_order_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "external_code"
    t.string "name"
    t.decimal "price", precision: 15, scale: 10
    t.integer "quantity"
    t.decimal "total", precision: 15, scale: 10
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "sub_items"
    t.index ["order_id"], name: "index_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "external_code"
    t.decimal "subtotal"
    t.decimal "delivery_fee"
    t.decimal "total"
    t.datetime "created_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "store_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "type_payment"
    t.decimal "value", precision: 15, scale: 10
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "addresses", "orders"
  add_foreign_key "addresses", "states"
  add_foreign_key "customers", "orders"
  add_foreign_key "items", "orders"
  add_foreign_key "payments", "orders"
end
