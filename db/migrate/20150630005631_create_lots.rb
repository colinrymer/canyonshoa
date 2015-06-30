class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.integer :street_id
      t.string :number

      t.timestamps
    end
  end
end
