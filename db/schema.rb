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

ActiveRecord::Schema.define(:version => 20120123145751) do

  create_table "daily_news", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "clicks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "theme_url"
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "top_story_id"
    t.string   "title"
    t.text     "content"
    t.integer  "estimation"
    t.integer  "score"
    t.string   "voted_usernames"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["top_story_id"], :name => "index_posts_on_top_story_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "top_stories", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "chosen"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.integer  "numberOfPosVotedPosts"
    t.integer  "numberOfNegVotedPosts"
    t.integer  "numberOfPosCreatedPosts"
    t.integer  "numberOfNegCreatedPosts"
    t.integer  "mind"
    t.integer  "votePower"
    t.string   "facebookEmail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
