class AddStockInProduct < ActiveRecord::Migration[8.0]
    def change
      add_column :products, :stock, :integer
    end
end
