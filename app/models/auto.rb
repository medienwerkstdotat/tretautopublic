class Auto < ActiveRecord::Base
  attr_accessible :hersteller, :modell, :land, :baujahr, :typ, :datenbanknr, :datenbanknralt, :status, :farbe, :antrieb, :konstruktion, :raeder, :ausstattung, :abmessungl, :abmessungb, :abmessungh, :gewichtinkg, :relevanz, :geschaetztermarktwert, :sonstiges, :anmerkungen, :kaufdatum, :ebaybenutzername, :verkaeufer, :ebayartikelnummer, :modellbeschreibung, :farbekauf, :anmerkungnachkauf, :zahlungsart, :zahlungsdatum, :waehrung, :kaufpreis, :transport, :summe, :ersatzteile, :restaurier, :gesamt, :assets_attributes
  has_many :assets
  accepts_nested_attributes_for :assets, :allow_destroy => true
end
