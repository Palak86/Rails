class CartsController < ApplicationController
  before_action :authenticate_buyer!
  
  def show
    @cart = current_buyer.cart
    @cart_items = @cart&.cart_items&.includes(:product)&.order('products.price ASC')
  end
end
