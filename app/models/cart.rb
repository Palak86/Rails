class Cart < ApplicationRecord
  belongs_to :buyer , dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items  #join_table: 'carts_products'
  has_many :orders

  def total_price
    cart_items.includes(:product).sum { |item| item.product.price * item.quantity }
  end
  
end
