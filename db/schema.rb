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

ActiveRecord::Schema.define(version: 20170228062616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",                               null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",                          null: false
    t.string   "scopes"
    t.string   "previous_refresh_token", default: "", null: false
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "first_name"
    t.date     "dob"
    t.string   "gender"
    t.text     "address"
    t.string   "state"
    t.string   "city"
    t.integer  "zip_code"
    t.integer  "cell_phone"
    t.integer  "home_phone"
    t.integer  "office_phone"
    t.integer  "fax"
    t.string   "code_status"
    t.string   "emergency_contact_name1"
    t.integer  "emergency_contact_phone1"
    t.text     "emergency_contact_address1"
    t.string   "emergency_contact_name2"
    t.integer  "emergency_contact_phone2"
    t.text     "emergency_contact_address2"
    t.string   "poa_name"
    t.integer  "poa_phone"
    t.string   "poa_email"
    t.string   "pharmacy_name"
    t.integer  "pharmacy_phone"
    t.text     "pharmacy_address"
    t.string   "primary_insurance_name"
    t.integer  "primary_insurance_plocy_number"
    t.integer  "primary_insurance_group_number"
    t.integer  "primary_insurance_coverage_limits"
    t.integer  "primary_insurance_deductible"
    t.integer  "primary_insurance_copay"
    t.integer  "primary_insurance_coinsurance"
    t.integer  "primary_insurance_out_of_network_fee"
    t.string   "secondary_insurance_name"
    t.integer  "secondary_insurance_plocy_number"
    t.integer  "secondary_insurance_group_number"
    t.integer  "secondary_insurance_coverage_limits"
    t.integer  "secondary_insurance_deductible"
    t.integer  "secondary_insurance_copay"
    t.integer  "secondary_insurance_coinsurance"
    t.integer  "secondary_insurance_out_of_network_fee"
    t.string   "tertiary_insurance_name"
    t.integer  "tertiary_insurance_plocy_number"
    t.integer  "tertiary_insurance_group_number"
    t.integer  "tertiary_insurance_coverage_limits"
    t.integer  "tertiary_insurance_deductible"
    t.integer  "tertiary_insurance_copay"
    t.integer  "tertiary_insurance_coinsurance"
    t.integer  "tertiary_insurance_out_of_network_fee"
    t.integer  "user_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "status"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "profiles", "users"
end
