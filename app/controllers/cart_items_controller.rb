class CartItemsController < ApplicationController
  before_action :authenticate_buyer!

  def decrement
    
    cart_item = CartItem.find(params[:id])  # Find the cart item by ID
    # Only decrement if the quantity is greater than 1 (to avoid negative quantities)
    if cart_item.quantity > 1
      cart_item.decrement!(:quantity)  # Decrease the quantity by 1
    else
      flash[:notice] = "Quantity cannot be less than 1."
    end

    # Redirect back to the cart page
    redirect_to cart_path
  end

  # You can keep the remove action here as well
  def destroy
    cart_item = CartItem.find(params[:id])  # Find the cart item by ID
    cart_item.destroy  # Delete the cart item
    redirect_to cart_path, notice: 'Item removed from cart successfully.'
  end
end
