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

ActiveRecord::Schema.define(:version => 20120331174038) do

  create_table "bakashas", :force => true do |t|
    t.date     "recv_date"
    t.string   "reason"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "meeting_reason"
    t.string   "file_name"
    t.integer  "scan_id"
  end

  create_table "haavaras", :force => true do |t|
    t.integer  "prat"
    t.integer  "hotsaa_from"
    t.integer  "hotsaa_to"
    t.integer  "hotsaa_mut_from"
    t.integer  "hotsaa_mut_to"
    t.integer  "harshaa_from"
    t.integer  "harshaa_to"
    t.integer  "ska_from"
    t.integer  "ska_to"
    t.integer  "diff_hotsaa"
    t.integer  "diff_hotsaa_mut"
    t.integer  "diff_harshaa"
    t.integer  "diff_ska"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "pniya_id"
  end

  create_table "pniyas", :force => true do |t|
    t.integer  "mispar"
    t.integer  "bakasha_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "scans", :force => true do |t|
    t.string   "filename"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "password"
    t.string   "salt"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
