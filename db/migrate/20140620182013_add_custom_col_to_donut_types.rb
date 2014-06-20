class AddCustomColToDonutTypes < ActiveRecord::Migration
  def change
    add_column :donut_types, :custom, :string
  end
end
