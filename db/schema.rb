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

ActiveRecord::Schema.define(:version => 20140916230641) do

  create_table "copywrite_addresses", :force => true do |t|
    t.string   "address"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "copywrite_terms", :force => true do |t|
    t.string   "term"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "course_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "department_notices", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "date"
    t.integer  "department_id"
    t.string   "signed_by"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "department_updates", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "signed_by"
    t.datetime "date"
    t.integer  "department_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.integer  "institution_id"
    t.integer  "faculty_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "email_addresses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "empty_selects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "faculties", :force => true do |t|
    t.string   "name"
    t.integer  "institution_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "faculty_ads", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "address"
    t.text     "content"
    t.string   "website"
    t.decimal  "price",      :precision => 11, :scale => 2
    t.integer  "faculty_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "faculty_notices", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "signed_by"
    t.datetime "date"
    t.integer  "faculty_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "faculty_updates", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "date"
    t.string   "signed_by"
    t.integer  "faculty_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "faqs", :force => true do |t|
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "first_semester_course_outlines", :force => true do |t|
    t.string   "topic"
    t.string   "book_url"
    t.string   "video_url"
    t.text     "content"
    t.integer  "first_semester_course_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "first_semester_courses", :force => true do |t|
    t.string   "code"
    t.integer  "credit_load"
    t.text     "description"
    t.string   "title"
    t.integer  "course_type_id"
    t.integer  "level_id"
    t.string   "semester_id"
    t.text     "content"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "first_semester_library_book_outlines", :force => true do |t|
    t.string   "topic"
    t.text     "content"
    t.string   "book_url"
    t.integer  "first_semester_library_book_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "first_semester_library_books", :force => true do |t|
    t.string   "name"
    t.integer  "first_semester_course_id"
    t.text     "description"
    t.integer  "book_pages"
    t.text     "author"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "first_semester_past_questions", :force => true do |t|
    t.integer  "year"
    t.string   "solution_url"
    t.integer  "first_semester_course_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "institution_ads", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "address"
    t.text     "content"
    t.string   "website"
    t.decimal  "price",          :precision => 11, :scale => 2
    t.integer  "institution_id"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "institution_notices", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "signed_by"
    t.datetime "date"
    t.integer  "institution_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "institution_updates", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "institution_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "institutions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "levels", :force => true do |t|
    t.integer  "level"
    t.integer  "institution_id"
    t.integer  "faculty_id"
    t.integer  "department_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "nationalities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pins", :force => true do |t|
    t.string   "number"
    t.string   "serial"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "privacy_terms", :force => true do |t|
    t.text     "introduction"
    t.string   "policy"
    t.text     "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "second_semester_course_outlines", :force => true do |t|
    t.string   "topic"
    t.text     "content"
    t.string   "book_url"
    t.string   "video_url"
    t.integer  "second_semester_course_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "second_semester_courses", :force => true do |t|
    t.string   "code"
    t.integer  "course_type_id"
    t.integer  "credit_load"
    t.integer  "level_id"
    t.integer  "semester_id"
    t.string   "title"
    t.text     "content"
    t.text     "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "second_semester_library_book_outlines", :force => true do |t|
    t.string   "topic"
    t.text     "content"
    t.string   "book_url"
    t.integer  "second_semester_library_book_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "second_semester_library_books", :force => true do |t|
    t.string   "name"
    t.text     "author"
    t.integer  "book_pages"
    t.text     "description"
    t.integer  "second_semester_course_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "second_semester_past_questions", :force => true do |t|
    t.integer  "year"
    t.string   "solution_url"
    t.integer  "second_semester_course_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "semesters", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "state_of_origins", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "table_of_contents", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "terms_of_uses", :force => true do |t|
    t.text     "introduction"
    t.string   "terms"
    t.text     "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "titles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "updates", :force => true do |t|
    t.text     "description"
    t.integer  "event_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                     :default => "",   :null => false
    t.string   "encrypted_password",        :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             :default => 0,    :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "name"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "expiration"
    t.integer  "institution_id"
    t.integer  "faculty_id"
    t.integer  "department_id"
    t.integer  "level_id"
    t.integer  "first_semester_course_id"
    t.string   "pin"
    t.integer  "pin_load_attempt",          :default => 0
    t.boolean  "pin_access",                :default => true
    t.integer  "second_semester_course_id"
    t.string   "selected_course"
    t.date     "age"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "alternative_email"
    t.integer  "title_id"
    t.integer  "state_of_origin_id"
    t.text     "address"
    t.integer  "nationality_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
