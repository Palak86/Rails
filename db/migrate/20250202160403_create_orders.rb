class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :buyer, null: false, foreign_key: true

      t.string :address
      t.string :city
      t.string :zipcode
      t.string :status

      t.timestamps
    end
  end
end
