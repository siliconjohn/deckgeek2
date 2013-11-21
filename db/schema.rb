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

ActiveRecord::Schema.define(:version => 20131002231027) do

  create_table "cards", :force => true do |t|
    t.string   "name",       :default => "My Card"
    t.integer  "deck_id"
    t.text     "html",       :default => "<div class=\"jcard\"><img class=\"jcard-bg-image\" style=\"position: relative;\" src=\"http://www.siliconjohn.com/deckgeek/images/2.jpg\" alt=\"2.jpg\" data-id=\"2\"><div class=\"jcard-border\"></div><div class=\"jcard-text\" style=\"left: 17px; top: 16px;\"><div class=\"jspan\">Card title, click me to change the text.</div></div><div class=\"jcard-text\" style=\"left: 17px; top: 279px;\"><div class=\"jspan\">Card description </div></div></div>"
    t.datetime "created_at",                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 :null => false
    t.datetime "updated_at",                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 :null => false
  end

  add_index "cards", ["deck_id"], :name => "index_cards_on_deck_id"

  create_table "decks", :force => true do |t|
    t.string   "name",        :default => "My deck of cards"
    t.string   "description", :default => "Describe your deck here"
    t.integer  "game_id"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  add_index "decks", ["game_id"], :name => "index_decks_on_game_id"

  create_table "feedbacks", :force => true do |t|
    t.string   "subject"
    t.string   "body"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games", :force => true do |t|
    t.string   "name",        :default => "My Game!"
    t.string   "description", :default => "This is an example game, you can do anything you want to it."
    t.integer  "user_id"
    t.datetime "created_at",                                                                              :null => false
    t.datetime "updated_at",                                                                              :null => false
  end

  add_index "games", ["user_id"], :name => "index_games_on_user_id"

  create_table "image_tags", :force => true do |t|
    t.integer  "image_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "title",      :default => "Image Tag"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.boolean  "admin",                                 :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
