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

ActiveRecord::Schema.define(:version => 20141111080314) do

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
  end

  create_table "test_plans", :force => true do |t|
    t.string   "name"
    t.string   "host"
    t.string   "user_name"
    t.string   "pd"
    t.string   "log_path"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "test_num"
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
  end

end
