class AddFwToAutos < ActiveRecord::Migration
  def self.up
    add_column :autos, :fw, :string
  end

  def self.down
    remove_column :autos, :fw
  end
end
