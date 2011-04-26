class Asset < ActiveRecord::Base
  belongs_to :auto
  has_attached_file :asset, :styles => { :large => "640x480", :medium => "300.300>", :thumb => "60x45>" }
end
