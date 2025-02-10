class OrdersController < ApplicationController

  def index
    @orders = current_buyer.orders
    @all_products = @orders.map { |order| JSON.parse(order.products_data) }.flatten
  end
  
  def new
    @order=Order.new
  end 
  
  def create
    @cart=current_buyer.cart
    @order = @cart.orders.create(buyer_id: @cart.buyer_id, **order_params)
  #  OrderMailer.with(order: @order).welcome_email.deliver_now
    flash[:notice] = "order has been placed."


    if @order.present?
      @order.update(products_data: @cart.cart_items.map do |cart_item|
        {
          product_id: cart_item.product_id,
          product_name: cart_item.product.name,
          quantity: cart_item.quantity,
          price: cart_item.product.price,
          image_url: cart_item.product.image.attached? ? url_for(cart_item.product.image) : nil
        }
      end.to_json)
      # @cart.cart_items.destroy_all
      redirect_to payments_new_path
    else 
      redirect_to new_order_path
    end
  end
  
    private
   
    def order_params
      params.require(:order).permit(:address, :city, :zipcode)
    end
  end