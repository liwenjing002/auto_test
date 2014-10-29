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

ActiveRecord::Schema.define(:version => 20141029052112) do

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
    t.string   "host"
    t.string   "user_name"
    t.string   "pd"
  end

  create_table "test_scripts", :force => true do |t|
    t.string   "test_case_id"
    t.string   "test_plan_id"
    t.text     "script_content"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
