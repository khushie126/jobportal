# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_04_08_053938) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "applied_jobs", force: :cascade do |t|
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id", null: false
    t.bigint "job_post_id", null: false
    t.bigint "user_id", null: false
    t.index ["company_id"], name: "index_applied_jobs_on_company_id"
    t.index ["job_post_id"], name: "index_applied_jobs_on_job_post_id"
    t.index ["user_id"], name: "index_applied_jobs_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.text "description"
    t.string "location"
    t.float "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "college_name"
    t.string "school_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_information_id", null: false
    t.integer "score_type", default: 0
    t.string "score"
    t.index ["profile_information_id"], name: "index_educations_on_profile_information_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "company_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_information_id", null: false
    t.index ["profile_information_id"], name: "index_experiences_on_profile_information_id"
  end

  create_table "job_posts", force: :cascade do |t|
    t.string "title"
    t.string "job_type"
    t.text "description"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id", null: false
    t.integer "count"
    t.index ["company_id"], name: "index_job_posts_on_company_id"
  end

  create_table "profile_informations", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "phone_number"
    t.string "profile_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.bigint "user_id"
    t.index ["company_id"], name: "index_profile_informations_on_company_id"
    t.index ["user_id"], name: "index_profile_informations_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_information_id", null: false
    t.index ["profile_information_id"], name: "index_projects_on_profile_information_id"
  end

  create_table "skill_assignments", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.string "skillable_type", null: false
    t.bigint "skillable_id", null: false
    t.integer "level", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id", "skillable_type", "skillable_id"], name: "index_skill_assignments_on_skill_and_skillable", unique: true
    t.index ["skill_id"], name: "index_skill_assignments_on_skill_id"
    t.index ["skillable_type", "skillable_id"], name: "index_skill_assignments_on_skillable"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "applied_jobs", "companies"
  add_foreign_key "applied_jobs", "job_posts"
  add_foreign_key "applied_jobs", "users"
  add_foreign_key "educations", "profile_informations"
  add_foreign_key "experiences", "profile_informations"
  add_foreign_key "job_posts", "companies"
  add_foreign_key "profile_informations", "users"
  add_foreign_key "projects", "profile_informations"
  add_foreign_key "skill_assignments", "skills"
end
