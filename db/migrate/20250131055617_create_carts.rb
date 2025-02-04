class CreateCarts < ActiveRecord::Migration[8.0]
  def change
    create_table :carts do |t|
      t.belongs_to :buyer
      t.timestamps
    end
  end
end
