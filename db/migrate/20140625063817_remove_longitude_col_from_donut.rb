class RemoveLongitudeColFromDonut < ActiveRecord::Migration
  def change
    remove_column :donuts, :longitude, :float
  end
end
