class CartItemsController < ApplicationController
  before_action :authenticate_buyer!

  def decrement
    
    cart_item = CartItem.find(params[:id])  
    if cart_item.quantity > 1
      cart_item.decrement!(:quantity)  
    else
      flash[:notice] = "Quantity cannot be less than 1."
    end

    redirect_to cart_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])  
    cart_item.destroy
    redirect_to cart_path, notice: 'Item removed from cart successfully.'
  end
end
