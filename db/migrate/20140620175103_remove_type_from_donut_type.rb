class RemoveTypeFromDonutType < ActiveRecord::Migration
  def change
    remove_column :donut_types, :type, :string
  end
end
