class AddProductsDataToOrders < ActiveRecord::Migration[8.0]
    def change
      add_column :orders, :products_data, :text
    end
end
