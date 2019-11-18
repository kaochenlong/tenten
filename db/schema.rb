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

ActiveRecord::Schema.define(version: 2019_11_18_055447) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.date "publish_date"
    t.decimal "list_price"
    t.decimal "sell_price"
    t.integer "page_num"
    t.string "isbn"
    t.string "isbn13"
    t.text "description"
    t.text "about"
    t.text "outline"
    t.boolean "on_sell"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["isbn"], name: "index_books_on_isbn", unique: true
    t.index ["isbn13"], name: "index_books_on_isbn13", unique: true
  end

end
