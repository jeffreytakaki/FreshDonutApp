class CreateDonutTypes < ActiveRecord::Migration
  def change
    create_table :donut_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
