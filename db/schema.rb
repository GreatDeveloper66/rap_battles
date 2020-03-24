# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_24_215702) do

  create_table "rapbattles", force: :cascade do |t|
    t.integer "challenger_id"
    t.integer "venue_id"
    t.integer "challenger_points"
    t.integer "challengee_points"
    t.string "challengee_id"
  end

  create_table "towns", force: :cascade do |t|
    t.string "name"
    t.integer "points"
    t.string "imgurl"
  end

  create_table "trashbattles", force: :cascade do |t|
    t.integer "trashtalk_id"
    t.integer "rapbattle_id"
  end

  create_table "trashtalks", force: :cascade do |t|
    t.string "snippet"
    t.integer "points"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "username"
    t.string "password_digest"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.integer "points"
    t.integer "town_id"
  end

end
