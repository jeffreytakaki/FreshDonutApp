class CreateDonuts < ActiveRecord::Migration
  def change
    create_table :donuts do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
