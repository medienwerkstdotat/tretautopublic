class CreateAutos < ActiveRecord::Migration
  def self.up
    create_table :autos do |t|
      t.string :hersteller
      t.string :modell
      t.string :land
      t.integer :baujahr
      t.string :typ
      t.integer :datenbanknr
      t.integer :datenbanknralt
      t.string :status
      t.string :farbe
      t.string :antrieb
      t.string :konstruktion
      t.integer :raeder
      t.string :ausstattung
      t.float :abmessungl
      t.float :abmessungb
      t.float :abmessungh
      t.float :gewichtinkg
      t.string :relevanz
      t.integer :geschaetztermarktwert
      t.string :sonstiges
      t.text :anmerkungen
      t.date :kaufdatum
      t.string :ebaybenutzername
      t.string :verkaeufer
      t.integer :ebayartikelnummer
      t.string :modellbeschreibung
      t.string :farbekauf
      t.string :anmerkungnachkauf
      t.string :zahlungsart
      t.date :zahlungsdatum
      t.string :waehrung
      t.integer :kaufpreis
      t.string :transport
      t.integer :summe
      t.string :ersatzteile
      t.string :restaurier
      t.string :gesamt
      t.timestamps
    end
  end

  def self.down
    drop_table :autos
  end
end
