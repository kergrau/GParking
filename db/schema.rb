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

ActiveRecord::Schema.define(version: 2019_07_26_223134) do

  create_table "invoice_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "invoice_id"
    t.string "ind_inicio"
    t.string "ind_fin"
    t.float "ind_minutos"
    t.float "ind_valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "record_id"
    t.string "in_number", limit: 6
    t.date "in_date"
    t.time "in_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "levels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "parking_id"
    t.decimal "lev_percent_pay", precision: 3, scale: 2
    t.string "lev_level", limit: 2
    t.decimal "lev_min", precision: 3, scale: 2
    t.decimal "lev_max", precision: 3, scale: 2
    t.string "lev_type_car", limit: 10
    t.boolean "lev_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parkings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "par_name", limit: 20
    t.string "par_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "par_state"
    t.string "par_latitude", limit: 15
    t.string "par_longitude", limit: 15
  end

  create_table "people", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre1", limit: 20
    t.string "nombre2", limit: 20
    t.string "apellido1", limit: 20
    t.string "apellido2", limit: 20
    t.string "dni", limit: 10
    t.string "correo", limit: 60
    t.string "telefono", limit: 10
    t.string "direccion", limit: 200
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "valor", precision: 10
    t.string "tipo_carro", limit: 10
    t.time "hora_inicio"
    t.time "hora_fin"
    t.boolean "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parking_id"
  end

  create_table "railcars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "person_id"
    t.string "placa", limit: 7
    t.string "marca", limit: 20
    t.string "modelo", limit: 20
    t.string "tipo", limit: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "railcar_id", limit: 8
    t.bigint "space_id"
    t.datetime "horainicio"
    t.datetime "horafinal"
    t.boolean "estado"
    t.string "rec_type", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level_id"
  end

  create_table "spaces", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "sp_floor", limit: 2
    t.integer "sp_number", limit: 3
    t.boolean "sp_state"
    t.string "sp_type", limit: 7
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parking_id"
  end

end
