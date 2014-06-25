class AddLatitudeAndLongitudeToDonut < ActiveRecord::Migration
  def change
    add_column :donuts, :latitude, :float
    add_column :donuts, :longitude, :float
  end
end
