class AddFwkaufpreisAndFwtransportAndFwsummeAndFwersatzteileAndFwrestaurierAndFwgesamtToAutos < ActiveRecord::Migration
  def self.up
    add_column :autos, :fwkaufpreis, :string
    add_column :autos, :fwtransport, :string
    add_column :autos, :fwsumme, :string
    add_column :autos, :fwersatzteile, :string
    add_column :autos, :fwrestaurier, :string
    add_column :autos, :fwgesamt, :string
  end

  def self.down
    remove_column :autos, :fwgesamt
    remove_column :autos, :fwrestaurier
    remove_column :autos, :fwersatzteile
    remove_column :autos, :fwsumme
    remove_column :autos, :fwtransport
    remove_column :autos, :fwkaufpreis
  end
end
