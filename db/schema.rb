# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_200_222_161_317) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addresses', force: :cascade do |t|
    t.bigint 'customer_id'
    t.text 'street'
    t.string 'location'
    t.text 'landmark'
    t.string 'pincode'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['customer_id'], name: 'index_addresses_on_customer_id'
  end

  create_table 'customers', force: :cascade do |t|
    t.string 'name'
    t.string 'primary_phone_no'
    t.string 'secondary_phone_no'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'product_details', force: :cascade do |t|
    t.bigint 'service_request_id'
    t.string 'category'
    t.string 'sub_category'
    t.integer 'quantity'
    t.string 'purchased_from'
    t.string 'bill_no'
    t.date 'bill_date'
    t.boolean 'warranty'
    t.string 'modelcode'
    t.string 'modelname'
    t.string 'serial_no'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['service_request_id'], name: 'index_product_details_on_service_request_id'
  end

  create_table 'service_requests', force: :cascade do |t|
    t.bigint 'customer_id'
    t.bigint 'address_id'
    t.string 'call_id'
    t.text 'problem'
    t.integer 'status', default: 0
    t.text 'customer_remark'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['address_id'], name: 'index_service_requests_on_address_id'
    t.index ['customer_id'], name: 'index_service_requests_on_customer_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'product_details', 'service_requests'
end
