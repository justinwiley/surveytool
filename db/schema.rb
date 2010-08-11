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

ActiveRecord::Schema.define(:version => 20100809235448) do

  create_table "questions", :force => true do |t|
    t.integer  "survey_id"
    t.string   "name"
    t.integer  "range"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "answer_type"
    t.text     "answer1"
    t.text     "answer2"
    t.text     "answer3"
    t.text     "answer4"
    t.text     "answer5"
    t.text     "answer6"
    t.text     "answer7"
    t.text     "answer8"
    t.text     "answer9"
    t.text     "answer10"
    t.string   "spoken_file_name"
    t.string   "spoken_content_type"
    t.integer  "spoken_file_size"
    t.datetime "spoken_updated_at"
  end

  create_table "surveys", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "spoken_file_name"
    t.string   "spoken_content_type"
    t.integer  "spoken_file_size"
    t.datetime "spoken_updated_at"
  end

end
