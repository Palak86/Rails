class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :category
  has_many :cart_items
  has_many :carts, through: :cart_items 
end
