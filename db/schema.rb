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

ActiveRecord::Schema.define(version: 20190419164617) do

  create_table "invoice_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "invoices_id"
    t.string "ind_inicio"
    t.string "ind_fin"
    t.float "ind_minutos", limit: 24
    t.float "ind_valor", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "records_id", limit: 6
    t.string "in_number", limit: 6
    t.date "in_date"
    t.time "in_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
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

  create_table "prices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.decimal "valor", precision: 10
    t.string "tipo_carro", limit: 10
    t.time "hora_inicio"
    t.time "hora_fin"
    t.boolean "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railcars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "people_id", limit: 10
    t.string "placa", limit: 7
    t.string "marca", limit: 20
    t.string "modelo", limit: 20
    t.string "tipo", limit: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "railcars_id", limit: 10
    t.datetime "horafinal"
    t.boolean "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "horainicio"
    t.string "rec_type", limit: 1
    t.string "spaces_id", limit: 7
  end

  create_table "spaces", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "sp_floor", limit: 2
    t.integer "sp_number", limit: 3
    t.boolean "sp_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sp_type", limit: 7
  end

end
