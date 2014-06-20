class AddUserRefToDonut < ActiveRecord::Migration
  def change
    add_reference :donuts, :user, index: true
  end
end
