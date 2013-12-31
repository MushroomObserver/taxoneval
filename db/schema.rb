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

ActiveRecord::Schema.define(version: 20131222203558) do

  create_table "reports", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taxon_data", force: true do |t|
    t.integer  "taxon_id"
    t.string   "report_type"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taxon_data", ["taxon_id"], name: "index_taxon_data_on_taxon_id", using: :btree

  create_table "taxons", force: true do |t|
    t.integer  "report_id"
    t.string   "name"
    t.integer  "eol_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taxons", ["report_id"], name: "index_taxons_on_report_id", using: :btree

end
