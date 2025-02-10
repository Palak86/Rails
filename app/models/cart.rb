class Cart < ApplicationRecord
  belongs_to :buyer
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  has_many :orders, dependent: :destroy

  def total_price
    cart_items.includes(:product).sum { |item| item.product.price * item.quantity }
  end

  # def total_price
  #   cart_items.sum { |item| item.product.price * item.quantity }
  # end
  
end
