# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_24_055009) do

  create_table "items", charset: "utf8mb4", force: :cascade do |t|
    t.string "sku"
    t.string "title"
    t.string "nickname"
    t.float "price", default: 0.0
    t.integer "inventory", default: 0
    t.float "fulfillment_fee", default: 0.0
    t.float "unit_cost", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_items", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "purchase_order_id", null: false
    t.bigint "item_id", null: false
    t.string "currency"
    t.integer "quantity_ordered", default: 0
    t.integer "quantity_shipped", default: 0
    t.float "price", default: 0.0
    t.float "discount", default: 0.0
    t.float "tax", default: 0.0
    t.float "platform_fee", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["purchase_order_id"], name: "index_order_items_on_purchase_order_id"
  end

  create_table "purchase_orders", charset: "utf8mb4", force: :cascade do |t|
    t.string "order_num"
    t.datetime "purchase_date"
    t.string "status"
    t.string "sales_channel"
    t.float "order_total", default: 0.0
    t.integer "num_items_shipped", default: 0
    t.integer "num_items_unshipped", default: 0
    t.string "payment_method"
    t.datetime "shipped_at"
    t.float "shipping_price", default: 0.0
    t.float "shipping_tax", default: 0.0
    t.string "carrier"
    t.string "tracking_number"
    t.datetime "estimated_arrival_date"
    t.string "fulfillment_center"
    t.datetime "confirmed_at"
    t.datetime "returned_date"
    t.string "return_reason"
    t.text "notes"
    t.datetime "refunded_at"
    t.string "ship_to_name"
    t.string "ship_to_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "purchase_orders"
end
