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

ActiveRecord::Schema.define(:version => 20110521181302) do

  create_table "recipes", :force => true do |t|
    t.integer  "user_id"
    t.string   "user_name"
    t.string   "name"
    t.boolean  "is_veg"
    t.string   "category"
    t.string   "sub_category"
    t.string   "image"
    t.string   "video"
    t.string   "rating"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "steps"
    t.string   "comments"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "sub_categories", :force => true do |t|
    t.integer  "category_id"
    t.string   "sub_category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "profile_name"
    t.string   "address"
    t.string   "phone"
    t.integer  "mobile"
    t.integer  "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "permission"
    t.string   "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
