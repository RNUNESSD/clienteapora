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

ActiveRecord::Schema.define(version: 20150311130945) do

  create_table "article_categories", force: true do |t|
    t.string  "name"
    t.boolean "is_active", default: true
    t.string  "slug"
  end

  add_index "article_categories", ["is_active"], name: "index_article_categories_on_is_active", using: :btree
  add_index "article_categories", ["name"], name: "index_article_categories_on_name", unique: true, using: :btree
  add_index "article_categories", ["slug"], name: "index_article_categories_on_slug", unique: true, using: :btree

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "abstract"
    t.text     "content"
    t.datetime "published_at"
    t.integer  "article_category_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["article_category_id"], name: "articles_article_category_id_fk", using: :btree
  add_index "articles", ["slug"], name: "index_articles_on_slug", unique: true, using: :btree

  create_table "banner_categories", force: true do |t|
    t.string  "name"
    t.boolean "is_active",    default: true
    t.integer "image_width"
    t.integer "image_height"
  end

  add_index "banner_categories", ["is_active"], name: "index_banner_categories_on_is_active", using: :btree
  add_index "banner_categories", ["name"], name: "index_banner_categories_on_name", unique: true, using: :btree

  create_table "banners", force: true do |t|
    t.string   "image"
    t.string   "link"
    t.integer  "banner_category_id"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "banners", ["banner_category_id"], name: "banners_banner_category_id_fk", using: :btree
  add_index "banners", ["expires_at"], name: "index_banners_on_expires_at", using: :btree

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

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
    t.string   "title"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "images", ["imageable_id", "imageable_type"], name: "index_images_on_imageable_id_and_imageable_type", using: :btree

  create_table "newsletters", force: true do |t|
    t.string   "name",       default: ""
    t.string   "email",      default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "newsletters", ["email"], name: "index_newsletters_on_email", unique: true, using: :btree
  add_index "newsletters", ["name"], name: "index_newsletters_on_name", using: :btree

  create_table "page_images", force: true do |t|
    t.string   "image"
    t.string   "title"
    t.integer  "position"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_images", ["page_id"], name: "page_images_page_id_fk", using: :btree

  create_table "pages", force: true do |t|
    t.string   "title"
    t.string   "abstract"
    t.text     "content"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true, using: :btree
  add_index "pages", ["title"], name: "index_pages_on_title", unique: true, using: :btree

  create_table "permissions", force: true do |t|
    t.string   "description"
    t.string   "object_type"
    t.string   "action_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permissions", ["object_type", "action_name"], name: "index_permissions_on_object_type_and_action_name", unique: true, using: :btree

  create_table "permissions_roles", id: false, force: true do |t|
    t.integer "permission_id"
    t.integer "role_id"
  end

  add_index "permissions_roles", ["permission_id", "role_id"], name: "index_permissions_roles_on_permission_id_and_role_id", unique: true, using: :btree
  add_index "permissions_roles", ["role_id"], name: "permissions_roles_role_id_fk", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active",              default: true
    t.boolean  "is_admin",               default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["is_active"], name: "index_users_on_is_active", using: :btree
  add_index "users", ["is_admin"], name: "index_users_on_is_admin", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "users_role_id_fk", using: :btree

  add_foreign_key "articles", "article_categories", name: "articles_article_category_id_fk"

  add_foreign_key "banners", "banner_categories", name: "banners_banner_category_id_fk"

  add_foreign_key "page_images", "pages", name: "page_images_page_id_fk"

  add_foreign_key "permissions_roles", "permissions", name: "permissions_roles_permission_id_fk"
  add_foreign_key "permissions_roles", "roles", name: "permissions_roles_role_id_fk"

  add_foreign_key "users", "roles", name: "users_role_id_fk"

end
