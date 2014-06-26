class AddFreshToUser < ActiveRecord::Migration
  def change
    add_column :users, :fresh, :boolean
  end
end
