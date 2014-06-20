class AddKindToDonutType < ActiveRecord::Migration
  def change
    add_column :donut_types, :kind, :string
  end
end
