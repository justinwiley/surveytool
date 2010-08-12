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

ActiveRecord::Schema.define(:version => 20100812180426) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.string   "name"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "spoken_file_name"
    t.string   "spoken_content_type"
    t.integer  "spoken_file_size"
    t.datetime "spoken_updated_at"
  end

  create_table "current_survey", :force => true do |t|
    t.integer  "question_id"
    t.integer  "respondent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.integer  "survey_id"
    t.string   "name"
    t.integer  "range"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "answer_type"
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
