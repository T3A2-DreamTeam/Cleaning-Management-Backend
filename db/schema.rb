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

ActiveRecord::Schema.define(version: 2021_07_21_025949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street_number", null: false
    t.string "street_address", null: false
    t.string "unit_number"
    t.string "suburb", null: false
    t.string "state", null: false
    t.string "postcode", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "availables", force: :cascade do |t|
    t.date "day"
    t.bigint "user_id", null: false
    t.string "freedom"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_availables_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.text "body"
    t.string "phone_number"
    t.bigint "service_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_type_id"], name: "index_bookings_on_service_type_id"
  end

  create_table "clients", force: :cascade do |t|
    t.bigint "contact_information_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_information_id"], name: "index_clients_on_contact_information_id"
  end

  create_table "contact_informations", force: :cascade do |t|
    t.string "phone_number"
    t.string "first_name"
    t.string "last_name"
    t.bigint "address_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.index ["address_id"], name: "index_contact_informations_on_address_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "address_id", null: false
    t.bigint "service_type_id", null: false
    t.string "due_date"
    t.bigint "client_id", null: false
    t.datetime "time_in"
    t.datetime "time_out"
    t.boolean "reoccuring"
    t.integer "reoccuring_length"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_jobs_on_address_id"
    t.index ["client_id"], name: "index_jobs_on_client_id"
    t.index ["service_type_id"], name: "index_jobs_on_service_type_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "note"
    t.bigint "job_id"
    t.bigint "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_notes_on_client_id"
    t.index ["job_id"], name: "index_notes_on_job_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.text "url"
    t.bigint "job_id", null: false
    t.string "public_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_pictures_on_job_id"
  end

  create_table "service_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "hours_needed"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.bigint "contact_information_id", null: false
    t.boolean "isAdmin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_information_id"], name: "index_users_on_contact_information_id"
  end

  add_foreign_key "availables", "users"
  add_foreign_key "bookings", "service_types"
  add_foreign_key "clients", "contact_informations"
  add_foreign_key "contact_informations", "addresses"
  add_foreign_key "jobs", "addresses"
  add_foreign_key "jobs", "clients"
  add_foreign_key "jobs", "service_types"
  add_foreign_key "jobs", "users"
  add_foreign_key "notes", "clients"
  add_foreign_key "notes", "jobs"
  add_foreign_key "pictures", "jobs"
  add_foreign_key "users", "contact_informations"
end
