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

ActiveRecord::Schema.define(version: 2020_12_03_215644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "diameters", force: :cascade do |t|
    t.integer "dbh_trunk"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total"
  end

  create_table "raw_trees", force: :cascade do |t|
    t.integer "GEO_ID"
    t.float "X"
    t.float "Y"
    t.integer "STRUCTID"
    t.integer "ADDRESS"
    t.string "name"
    t.integer "DBH_TRUNK"
    t.integer "TREE_POSIT"
    t.string "COMMON_NAM"
    t.string "BOTANICAL_"
    t.point "geometry"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trees", force: :cascade do |t|
    t.string "common_name"
    t.string "botanical_name"
    t.integer "dbh_trunk"
    t.integer "address"
    t.string "name"
    t.integer "tree_posit"
    t.float "lat"
    t.float "long"
    t.bigint "type_id", null: false
    t.bigint "diameter_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["diameter_id"], name: "index_trees_on_diameter_id"
    t.index ["location_id"], name: "index_trees_on_location_id"
    t.index ["type_id"], name: "index_trees_on_type_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "common_name"
    t.string "botanical_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total"
  end

  add_foreign_key "trees", "diameters"
  add_foreign_key "trees", "locations"
  add_foreign_key "trees", "types"
end
