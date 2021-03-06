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

ActiveRecord::Schema.define(version: 20141219194948) do

  create_table "attendee_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "attendee_id"
  end

  add_index "attendee_users", ["attendee_id"], name: "index_attendee_users_on_attendee_id", using: :btree
  add_index "attendee_users", ["email"], name: "index_attendee_users_on_email", unique: true, using: :btree
  add_index "attendee_users", ["reset_password_token"], name: "index_attendee_users_on_reset_password_token", unique: true, using: :btree

  create_table "attendees", force: true do |t|
    t.string   "name"
    t.string   "mail"
    t.string   "phone"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_ticket", default: false
  end

  create_table "speaker_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "speaker_id"
  end

  add_index "speaker_users", ["email"], name: "index_speaker_users_on_email", unique: true, using: :btree
  add_index "speaker_users", ["reset_password_token"], name: "index_speaker_users_on_reset_password_token", unique: true, using: :btree
  add_index "speaker_users", ["speaker_id"], name: "index_speaker_users_on_speaker_id", using: :btree

  create_table "speakers", force: true do |t|
    t.string   "name"
    t.string   "mail"
    t.string   "phone"
    t.string   "country"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talk_durations", force: true do |t|
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talk_tracks", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talks", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "speaker_id"
    t.integer  "talk_track_id"
    t.integer  "talk_duration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "talks", ["speaker_id"], name: "index_talks_on_speaker_id", using: :btree
  add_index "talks", ["talk_duration_id"], name: "index_talks_on_talk_duration_id", using: :btree
  add_index "talks", ["talk_track_id"], name: "index_talks_on_talk_track_id", using: :btree

  create_table "ticket_sales", force: true do |t|
    t.string   "stripe_id"
    t.string   "card_name"
    t.string   "billing_address"
    t.integer  "price"
    t.integer  "last4"
    t.integer  "attendee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",          default: "pending"
    t.integer  "retry",           default: 0
  end

  add_index "ticket_sales", ["attendee_id"], name: "index_ticket_sales_on_attendee_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.integer  "speaker_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["speaker_id"], name: "index_users_on_speaker_id", using: :btree

end
