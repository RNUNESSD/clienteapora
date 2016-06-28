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

ActiveRecord::Schema.define(version: 20160628142806) do

  create_table "article_categories", force: :cascade do |t|
    t.string  "name",      limit: 255
    t.boolean "is_active",             default: true
    t.string  "slug",      limit: 255
  end

  add_index "article_categories", ["is_active"], name: "index_article_categories_on_is_active", using: :btree
  add_index "article_categories", ["name"], name: "index_article_categories_on_name", unique: true, using: :btree
  add_index "article_categories", ["slug"], name: "index_article_categories_on_slug", unique: true, using: :btree

  create_table "articles", force: :cascade do |t|
    t.string   "title",               limit: 255
    t.string   "abstract",            limit: 255
    t.text     "content",             limit: 65535
    t.datetime "published_at"
    t.integer  "article_category_id", limit: 4
    t.string   "slug",                limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["article_category_id"], name: "fk_rails_ab638c9159", using: :btree
  add_index "articles", ["slug"], name: "index_articles_on_slug", unique: true, using: :btree

  create_table "banner_categories", force: :cascade do |t|
    t.string  "name",         limit: 255
    t.boolean "is_active",                default: true
    t.integer "image_width",  limit: 4
    t.integer "image_height", limit: 4
  end

  add_index "banner_categories", ["is_active"], name: "index_banner_categories_on_is_active", using: :btree
  add_index "banner_categories", ["name"], name: "index_banner_categories_on_name", unique: true, using: :btree

  create_table "banners", force: :cascade do |t|
    t.string   "image",              limit: 255
    t.string   "link",               limit: 255
    t.integer  "banner_category_id", limit: 4
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",           limit: 4
  end

  add_index "banners", ["banner_category_id"], name: "fk_rails_c4ec726414", using: :btree
  add_index "banners", ["expires_at"], name: "index_banners_on_expires_at", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "email_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_contacts", force: :cascade do |t|
    t.string   "email",             limit: 255
    t.integer  "email_category_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "email_contacts", ["email_category_id"], name: "fk_rails_0addc4f34e", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "image",          limit: 255
    t.string   "title",          limit: 255
    t.integer  "imageable_id",   limit: 4
    t.string   "imageable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",       limit: 4
  end

  add_index "images", ["imageable_id", "imageable_type"], name: "index_images_on_imageable_id_and_imageable_type", using: :btree

  create_table "localizations", force: :cascade do |t|
    t.string   "link",       limit: 255
    t.string   "address",    limit: 255
    t.string   "image",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletters", force: :cascade do |t|
    t.string   "name",       limit: 255, default: ""
    t.string   "email",      limit: 255, default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "newsletters", ["email"], name: "index_newsletters_on_email", unique: true, using: :btree
  add_index "newsletters", ["name"], name: "index_newsletters_on_name", using: :btree

  create_table "page_images", force: :cascade do |t|
    t.string   "image",      limit: 255
    t.string   "title",      limit: 255
    t.integer  "position",   limit: 4
    t.integer  "page_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_images", ["page_id"], name: "fk_rails_1278ffe989", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "abstract",   limit: 255
    t.text     "content",    limit: 65535
    t.string   "slug",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true, using: :btree
  add_index "pages", ["title"], name: "index_pages_on_title", unique: true, using: :btree

  create_table "partners", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "link",       limit: 255
    t.string   "image",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "description", limit: 255
    t.string   "object_type", limit: 255
    t.string   "action_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permissions", ["object_type", "action_name"], name: "index_permissions_on_object_type_and_action_name", unique: true, using: :btree

  create_table "permissions_roles", id: false, force: :cascade do |t|
    t.integer "permission_id", limit: 4
    t.integer "role_id",       limit: 4
  end

  add_index "permissions_roles", ["permission_id", "role_id"], name: "index_permissions_roles_on_permission_id_and_role_id", unique: true, using: :btree
  add_index "permissions_roles", ["role_id"], name: "fk_rails_211043a277", using: :btree

  create_table "phones", force: :cascade do |t|
    t.string   "phone",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "role_id",                limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active",                          default: true
    t.boolean  "is_admin",                           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["is_active"], name: "index_users_on_is_active", using: :btree
  add_index "users", ["is_admin"], name: "index_users_on_is_admin", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "fk_rails_642f17018b", using: :btree

  add_foreign_key "articles", "article_categories"
  add_foreign_key "banners", "banner_categories"
  add_foreign_key "email_contacts", "email_categories"
  add_foreign_key "page_images", "pages"
  add_foreign_key "permissions_roles", "permissions"
  add_foreign_key "permissions_roles", "roles"
  add_foreign_key "users", "roles"
end
