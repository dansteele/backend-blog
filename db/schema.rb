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

ActiveRecord::Schema.define(:version => 20150130171232) do

  create_table "comments", :force => true do |t|
    t.string  "body"
    t.integer "kudos"
    t.integer "author_id"
    t.integer "post_id"
  end

  create_table "images", :force => true do |t|
    t.string  "url"
    t.integer "caption"
    t.integer "filesize"
    t.integer "post_id"
  end

  create_table "post_tags", :force => true do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  create_table "posts", :force => true do |t|
    t.string  "body"
    t.text    "title"
    t.integer "author_id"
    t.text    "slug"
    t.integer "published"
  end

  create_table "tags", :force => true do |t|
    t.string  "name"
    t.integer "popularity"
    t.text    "slug"
  end

  create_table "users", :force => true do |t|
    t.string  "name"
    t.string  "twitter"
    t.integer "image_id"
    t.string  "email"
    t.text    "github"
    t.text    "dob"
    t.text    "password"
    t.text    "password2"
    t.boolean "tc"
    t.text    "username"
  end

end
