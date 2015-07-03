class ChangeUsersAdminColumn < ActiveRecord::Migration
  def change
    User.where(admin: nil).update_all(admin: false)
    change_column(:users, :admin, :boolean, default: false, null: false)
  end
end
