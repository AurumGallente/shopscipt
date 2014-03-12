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

ActiveRecord::Schema.define(version: 20140204123849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "description"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry", using: :btree

  create_table "characteristics", force: true do |t|
    t.integer  "characteristicable_id"
    t.string   "characteristicable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characteristics_properties", id: false, force: true do |t|
    t.integer "characteristic_id", null: false
    t.integer "property_id",       null: false
  end

  add_index "characteristics_properties", ["characteristic_id", "property_id"], name: "cp_index1", unique: true, using: :btree
  add_index "characteristics_properties", ["property_id", "characteristic_id"], name: "cp_index2", unique: true, using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "images", force: true do |t|
    t.string   "image"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "primary",        default: false
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "article"
    t.float    "dealerprice"
    t.string   "dealercount"
    t.float    "largeprice"
    t.float    "smallprice"
    t.string   "smallcount"
    t.float    "retailprice"
    t.string   "retailcount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "stopprice"
    t.string   "stopcount"
    t.string   "largecount"
    t.string   "title"
    t.string   "description"
    t.string   "h1"
    t.string   "keywords"
    t.string   "slug"
    t.integer  "category_id"
    t.text     "text"
  end

  add_index "products", ["article"], name: "index_products_on_article", unique: true, using: :btree
  add_index "products", ["slug"], name: "index_products_on_slug", using: :btree

  create_table "properties", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
