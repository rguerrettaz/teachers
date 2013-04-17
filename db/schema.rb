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

ActiveRecord::Schema.define(:version => 20130416203049) do

  create_table "comments", :force => true do |t|
    t.integer  "news_item_id"
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "news_items", :force => true do |t|
    t.string   "published_at"
    t.string   "source"
    t.string   "source_user"
    t.string   "source_url"
    t.string   "format"
    t.string   "vote"
    t.string   "popularity"
    t.text     "body"
    t.string   "title"
    t.string   "photo_urls"
    t.string   "asking_name"
    t.string   "asking_url"
    t.string   "profile_pic"
    t.string   "source_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "source_user_url"
    t.text     "caption"
    t.text     "question"
    t.text     "answer"
  end

  create_table "schools", :force => true do |t|
    t.string   "schoolid"
    t.string   "schoolname"
    t.string   "zip"
    t.string   "address"
    t.string   "city"
    t.string   "districtid"
    t.string   "AYPResultYear"
    t.string   "distance"
    t.string   "enrollment"
    t.string   "gradelevel"
    t.string   "gradesserved"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "phonenumber"
    t.string   "schooldistrictname"
    t.string   "schooltype"
    t.string   "state"
    t.string   "studentteacherratio"
    t.string   "website"
    t.string   "testrating_text"
    t.string   "testrating_year"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "comment_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
