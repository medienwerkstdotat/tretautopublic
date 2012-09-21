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

ActiveRecord::Schema.define(:version => 20110427204635) do

  create_table "assets", :force => true do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "autos", :force => true do |t|
    t.string   "hersteller"
    t.string   "modell"
    t.string   "land"
    t.string  "baujahr"
    t.string   "typ"
    t.integer  "datenbanknr"
    t.integer  "datenbanknralt"
    t.string   "status"
    t.string   "farbe"
    t.string   "antrieb"
    t.string   "konstruktion"
    t.integer  "raeder"
    t.string   "ausstattung"
    t.float    "abmessungl"
    t.float    "abmessungb"
    t.float    "abmessungh"
    t.float    "gewichtinkg"
    t.string   "relevanz"
    t.integer  "geschaetztermarktwert"
    t.string   "sonstiges"
    t.text     "anmerkungen"
    t.date     "kaufdatum"
    t.string   "ebaybenutzername"
    t.string   "verkaeufer"
    t.integer  "ebayartikelnummer"
    t.string   "modellbeschreibung"
    t.string   "farbekauf"
    t.string   "anmerkungnachkauf"
    t.string   "zahlungsart"
    t.date     "zahlungsdatum"
    t.string   "waehrung"
    t.integer  "kaufpreis"
    t.string   "transport"
    t.integer  "summe"
    t.string   "ersatzteile"
    t.string   "restaurier"
    t.string   "gesamt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fw"
    t.string   "fwkaufpreis"
    t.string   "fwtransport"
    t.string   "fwsumme"
    t.string   "fwersatzteile"
    t.string   "fwrestaurier"
    t.string   "fwgesamt"
  end

end
