class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :category
  has_many :cart_items
  # has_and_belongs_to_many :carts above is extra
  has_many :carts, through: :cart_items 
  #, join_table: 'carts_products'
end
