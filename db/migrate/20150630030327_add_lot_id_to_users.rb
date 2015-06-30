class AddLotIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lot_id, :integer
  end
end
