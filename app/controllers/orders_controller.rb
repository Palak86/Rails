class OrdersController < ApplicationController

  def index
    @orders = current_buyer.orders
  end
  
  def new
    @order=Order.new
  end 
  
  def create
    @cart=current_buyer.cart
    @order = @cart.orders.create(buyer_id: @cart.buyer_id, **order_params)
    OrderMailer.with(order: @order).welcome_email.deliver_now

    if @order.present?
        @cart.products.delete_all
        flash[:notice] = "order has been placed."
        redirect_to products_path
    else 
      redirect_to new_order_path
    end
    
  end
  
    private
   
    def order_params
      params.require(:order).permit(:address, :city, :zipcode)
    end
  end