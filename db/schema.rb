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

ActiveRecord::Schema.define(version: 20141018220650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cl_sites", force: true do |t|
    t.string   "region",                    null: false
    t.string   "subregion",                 null: false
    t.string   "name",                      null: false
    t.string   "base_url",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_fetched"
    t.integer  "total_entries", default: 0, null: false
    t.integer  "no_matches",    default: 0, null: false
    t.integer  "cplusplus",     default: 0, null: false
    t.integer  "assembly",      default: 0, null: false
    t.integer  "ruby",          default: 0, null: false
    t.integer  "python",        default: 0, null: false
    t.integer  "javascript",    default: 0, null: false
    t.integer  "php",           default: 0, null: false
    t.integer  "perl",          default: 0, null: false
    t.integer  "java",          default: 0, null: false
    t.integer  "go",            default: 0, null: false
    t.integer  "csharp",        default: 0, null: false
    t.integer  "objectivec",    default: 0, null: false
    t.integer  "clang",         default: 0, null: false
    t.integer  "erlang",        default: 0, null: false
    t.integer  "ocaml",         default: 0, null: false
    t.integer  "coldfusion",    default: 0, null: false
    t.integer  "haskell",       default: 0, null: false
    t.integer  "fortran",       default: 0, null: false
    t.integer  "cobol",         default: 0, null: false
    t.integer  "lisp",          default: 0, null: false
    t.integer  "scheme",        default: 0, null: false
    t.integer  "scala",         default: 0, null: false
    t.integer  "matlab",        default: 0, null: false
    t.integer  "octave",        default: 0, null: false
    t.integer  "pascal",        default: 0, null: false
    t.integer  "clojure",       default: 0, null: false
    t.integer  "groovy",        default: 0, null: false
    t.integer  "msshell",       default: 0, null: false
    t.integer  "unixshell",     default: 0, null: false
  end

end
