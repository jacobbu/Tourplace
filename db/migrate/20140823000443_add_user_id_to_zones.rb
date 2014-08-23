class AddUserIdToZones < ActiveRecord::Migration
  def change
    add_column :zones, :user_id, :integer
    add_index :zones, :user_id
  end
end
