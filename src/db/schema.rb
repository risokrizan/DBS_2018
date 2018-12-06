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

ActiveRecord::Schema.define(version: 20180417093346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acc_types", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.string "number"
    t.integer "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.integer "bank_id"
    t.integer "currency_id"
    t.integer "acc_type_id"
    t.index ["bank_id"], name: "index_accounts_on_bank_id"
    t.index ["customer_id"], name: "index_accounts_on_customer_id"
    t.index ["number"], name: "index_accounts_on_number"
  end

  create_table "announcements", force: :cascade do |t|
    t.string "author"
    t.text "text"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banks", force: :cascade do |t|
    t.string "bank_name"
    t.string "street"
    t.string "city"
    t.date "estabilished_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "street_number"
    t.index ["bank_name"], name: "index_banks_on_bank_name"
  end

  create_table "computers", force: :cascade do |t|
    t.string "cpu_name"
    t.float "cpu_clock"
    t.integer "cpu_cores"
    t.string "gpu_name"
    t.float "gpu_clock"
    t.integer "gpu_cores"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.index ["customer_id"], name: "index_computers_on_customer_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "id_card_number"
    t.string "street"
    t.string "city"
    t.integer "zip"
    t.integer "street_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name", "last_name"], name: "index_customers_on_first_name_and_last_name"
  end

  create_table "income_by_custommers", force: :cascade do |t|
    t.date "date"
    t.integer "income"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.integer "pool_id"
  end

  create_table "mining_histories", force: :cascade do |t|
    t.datetime "connected_at"
    t.datetime "disconnected_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "computer_id"
    t.integer "pool_id"
  end

  create_table "pools", force: :cascade do |t|
    t.string "name"
    t.integer "income"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bank_id"
    t.integer "currency_id"
    t.index ["bank_id"], name: "index_pools_on_bank_id"
    t.index ["name"], name: "index_pools_on_name"
  end

  create_table "trans_states", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trans_types", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string "name"
    t.integer "ammount"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.integer "currency_id"
    t.integer "trans_type_id"
    t.integer "trans_state_id"
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["trans_state_id"], name: "index_transactions_on_trans_state_id"
  end

  add_foreign_key "accounts", "acc_types"
  add_foreign_key "accounts", "banks"
  add_foreign_key "accounts", "currencies"
  add_foreign_key "accounts", "customers"
  add_foreign_key "computers", "customers"
  add_foreign_key "income_by_custommers", "customers"
  add_foreign_key "income_by_custommers", "pools"
  add_foreign_key "mining_histories", "computers"
  add_foreign_key "mining_histories", "pools"
  add_foreign_key "pools", "banks"
  add_foreign_key "pools", "currencies"
  add_foreign_key "transactions", "accounts"
  add_foreign_key "transactions", "currencies"
  add_foreign_key "transactions", "trans_states"
  add_foreign_key "transactions", "trans_types"
end
