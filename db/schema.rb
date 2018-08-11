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

ActiveRecord::Schema.define(version: 20180811005153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocks", force: :cascade do |t|
    t.bigint "experience_id"
    t.date "fecha_salida"
    t.string "lugar_salida"
    t.time "hora_salida"
    t.date "fecha_regreso"
    t.decimal "precio_adulto", default: "0.0"
    t.decimal "precio_nino", default: "0.0"
    t.integer "capacidad", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "habitacion_doble", default: 0.0
    t.float "habitacion_triple", default: 0.0
    t.float "habitacion_cuadruple", default: 0.0
    t.float "menor_extra", default: 0.0
    t.index ["experience_id"], name: "index_blocks_on_experience_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.boolean "disponible", default: true
    t.string "nombre"
    t.string "lugar"
    t.string "categoria"
    t.string "dias"
    t.string "foto"
    t.bigint "user_id"
    t.text "incluye"
    t.text "itinerario"
    t.text "que_plan"
    t.text "recomendaciones"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "descripcion"
    t.string "slug"
    t.text "politics"
    t.index ["slug"], name: "index_experiences_on_slug", unique: true
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "images", force: :cascade do |t|
    t.string "image2"
    t.bigint "experience_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experience_id"], name: "index_images_on_experience_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "stripe_token"
    t.integer "many", default: 0
    t.integer "many_n", default: 0
    t.bigint "block_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hab_doble", default: 0
    t.integer "hab_triple", default: 0
    t.integer "hab_cuadrupple", default: 0
    t.integer "menor_ex", default: 0
    t.float "total", default: 0.0
    t.float "mas_adultos", default: 0.0
    t.float "mas_menores", default: 0.0
    t.index ["block_id"], name: "index_orders_on_block_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "packages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "block_id"
    t.integer "habitaciones", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_id"], name: "index_packages_on_block_id"
    t.index ["user_id"], name: "index_packages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "admin", default: false
    t.string "stripe_card_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "blocks", "experiences"
  add_foreign_key "experiences", "users"
  add_foreign_key "images", "experiences"
  add_foreign_key "orders", "blocks"
  add_foreign_key "orders", "users"
  add_foreign_key "packages", "blocks"
  add_foreign_key "packages", "users"
end
