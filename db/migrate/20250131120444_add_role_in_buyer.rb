class AddRoleInBuyer < ActiveRecord::Migration[8.0]
  def change
    add_column :buyers, :role, :string  
  end
end
