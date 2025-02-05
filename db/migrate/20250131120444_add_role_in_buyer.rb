class AddRoleInBuyer < ActiveRecord::Migration[8.0]
  def change
    add_column :buyers, :role, :integer, default: 0, null: false
  end
end
