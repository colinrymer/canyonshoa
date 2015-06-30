class ChangeUsersApprovedColumn < ActiveRecord::Migration
  def change
    change_column(:users, :approved, :boolean, default: false, null: false)
  end
end
