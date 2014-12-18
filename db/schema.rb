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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141218030740) do

  create_table "flow_date_types", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "flow_types", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "test_case_flows", :force => true do |t|
    t.string   "test_case_id"
    t.string   "flow_type_id"
    t.integer  "flow_seq"
    t.string   "flow_location"
    t.string   "flow_date_type_id"
    t.text     "flow_date"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "test_cases", :force => true do |t|
    t.string   "title"
    t.text     "desc"
    t.string   "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "test_plan_cases", :force => true do |t|
    t.string   "test_case_id"
    t.string   "test_plan_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "test_plan_data", :force => true do |t|
    t.string   "test_plan_id"
    t.string   "test_case_flow_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.text     "test_data"
    t.string   "flow_date_type_id"
  end

  create_table "test_plans", :force => true do |t|
    t.string   "name"
    t.string   "host"
    t.string   "user_name"
    t.string   "pd"
    t.string   "log_path"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "test_num"
    t.string   "user_id"
    t.text     "memo"
    t.string   "time_after"
    t.string   "time_every"
    t.string   "time_cron"
    t.string   "time_at"
    t.string   "job_id"
    t.string   "job_status"
    t.string   "carbon_email"
  end

  create_table "test_results", :force => true do |t|
    t.string   "test_plan_id"
    t.string   "test_case_id"
    t.string   "test_script_id"
    t.text     "test_result_content"
    t.boolean  "test_result_flag"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "test_scripts", :force => true do |t|
    t.string   "test_case_id"
    t.string   "test_plan_id"
    t.text     "script_content"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0,  :null => false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
