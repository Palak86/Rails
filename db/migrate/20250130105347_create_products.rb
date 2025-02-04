class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.belongs_to :category
      t.timestamps
    end
  end
end



