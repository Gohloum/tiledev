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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140308042936) do

  create_table "game_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "m3_boards", force: true do |t|
    t.string   "name"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "m3_level_id"
  end

  create_table "m3_levels", force: true do |t|
    t.string   "name"
    t.text     "data"
    t.integer  "active"
    t.integer  "order"
    t.text     "icons"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "m3_board_id"
  end

  create_table "m3_levels_projects", force: true do |t|
    t.integer "m3_level_id"
    t.integer "project_id"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_type_id"
  end

end
