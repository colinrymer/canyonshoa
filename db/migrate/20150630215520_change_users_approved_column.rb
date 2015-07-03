class ChangeUsersApprovedColumn < ActiveRecord::Migration
  def change
    User.where(approved: nil).update_all(approved: false)
    change_column(:users, :approved, :boolean, default: false, null: false)
  end
end
