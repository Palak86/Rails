class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0, message: "must be a non-negative, non-zero integer" }
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "must be a non-negative, non-zero integer" }
  has_one_attached :image
  belongs_to :category
  has_many :cart_items
  has_many :carts, through: :cart_items
end
