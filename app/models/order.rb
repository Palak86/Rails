class Order < ApplicationRecord
  # include Rails.application.routes.url_helpers
  # after_save :update_products_data

  belongs_to :cart
  belongs_to :buyer
  
  validates :address,:city, presence: true
  validates :zipcode, presence: true, format: { with: /\A\d{6}\z/, message: "must be a 6-digit number" }
  
  # private

  # def update_products_data
  #         # @order.update(products_data: @cart.cart_items.map do |cart_item|
  #   return unless cart.present? && cart.cart_items.any?
  #   self.products_data = cart.cart_items.map do |cart_item|
  #     {
  #       product_id: cart_item.product_id,
  #       product_name: cart_item.product.name,
  #       quantity: cart_item.quantity,
  #       price: cart_item.product.price,
  #       image_url: cart_item.product.image.attached? ? Rails.application.routes.url_helpers.url_for(cart_item.product.image) : nil
  #     }
  #   end.to_json
  #   self.save!
    
  # end
end


