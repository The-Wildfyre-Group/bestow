# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160525204958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_items", force: :cascade do |t|
    t.integer "quantity"
    t.integer "product_id"
    t.integer "price_cents",    default: 0,     null: false
    t.string  "price_currency", default: "USD", null: false
    t.integer "owner_id"
    t.string  "owner_type"
  end

  add_index "cart_items", ["owner_id"], name: "index_cart_items_on_owner_id", using: :btree
  add_index "cart_items", ["owner_type"], name: "index_cart_items_on_owner_type", using: :btree

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id", unique: true, using: :btree

  create_table "products", force: :cascade do |t|
    t.string  "title"
    t.integer "user_id"
    t.integer "price_cents",    default: 0,     null: false
    t.string  "price_currency", default: "USD", null: false
  end

  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "registries", force: :cascade do |t|
    t.integer "user_id"
    t.string  "title"
  end

  add_index "registries", ["user_id"], name: "index_registries_on_user_id", using: :btree

  create_table "registry_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "registry_id"
  end

  add_index "registry_products", ["product_id"], name: "index_registry_products_on_product_id", using: :btree
  add_index "registry_products", ["registry_id"], name: "index_registry_products_on_registry_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "city"
    t.string   "state"
    t.string   "password_digest"
    t.string   "reset_password_token"
    t.boolean  "admin"
    t.string   "authentication_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
