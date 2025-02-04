class CartsController < ApplicationController
  before_action :authenticate_buyer!
  
  def show
    # @cart = current_buyer.cart
    # @cart_items = @cart.cart_items

    @cart = current_buyer.cart # Assuming the cart is associated with the current_user

    # Default sorting by price (ascending)
    if params[:sort] == 'name'
      @cart_items = @cart.cart_items.includes(:product).order('products.name ASC')
    elsif params[:sort] == 'price_desc'
      @cart_items = @cart.cart_items.includes(:product).order('products.price DESC')
    elsif params[:sort] == 'quantity'
      @cart_items = @cart.cart_items.includes(:product).order('cart_items.quantity DESC')
    else
      # Default sorting by price (ascending)
      @cart_items = @cart.cart_items.includes(:product).order('products.price ASC')
    end
  end
  # def add_product
  #   @product = Product.find(params[:product_id])
  #   @cart = current_user.cart

  #   # Check if the product already exists in the cart
  #   existing_cart_product = @cart.products.find_by(id: @product.id)

  #   if existing_cart_product
  #     # If product already in cart
  #     @cart.products.find_by(id: @product.id).carts_products.find_by(product_id: @product.id).update(quantity: existing_cart_product.carts_products.quantity + params[:quantity].to_i)
  #   else
  #     # If product is not in the cart
  #     @cart.products << @product
  #     @cart.carts_products.last.update(quantity: params[:quantity].to_i)
  #   end

  #   redirect_to cart_path(@cart), notice: "#{@product.name} added to your cart."
  # end

  # def show
  #   @cart = current_user.cart
  # end

  # def update_quantity
  #   @cart_product = CartsProduct.find_by(cart_id: params[:cart_id], product_id: params[:product_id])
    
  #   if @cart_product.update(quantity: params[:quantity].to_i)
  #     redirect_to cart_path(@cart_product.cart), notice: 'Quantity updated.'
  #   else
  #     redirect_to cart_path(@cart_product.cart), alert: 'Error updating quantity.'
  #   end
  # end
end
