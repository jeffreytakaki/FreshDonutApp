class RemoveLatitudeColFromDonut < ActiveRecord::Migration
  def change
    remove_column :donuts, :latitude, :float
  end
end
