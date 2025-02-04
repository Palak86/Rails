class OrdersController < ApplicationController

  def index
    
    @orders = current_buyer.orders

    # @orders.each do |@order| 
    #   @products = @order.products
    # end 
  end

#   <h1>Order #<%= @order.id %> Products</h1>
# <ul>
#   <% @products.each do |product| %>
#     <li><%= product.name %> - <%= product.price %></li>
#   <% end %>
# </ul>



  def new
    @order=Order.new
  end 
    

# order = cart.orders.create(user: cart.user, order_params)


  def create
    @cart=current_buyer.cart
    # @cart= Cart.find_by(params[:order][:cart_id])

    
    @order = @cart.orders.create(buyer_id: @cart.buyer_id, **order_params)
    
    OrderMailer.with(order: @order).welcome_email.deliver_now

    # OrderMailer.welcome_email.deliver_now


    if @order.present?
        
      @cart.products.delete_all
      
      flash[:notice] = "order has been placed."
      redirect_to products_path
    else 
      redirect_to new_order_path
    end
      
    # @cart= Cart.find_by(params[:order][:cart_id])
    
    # @order = @cart.orders.create(order_params)
    # if @order.save
    #   @cart.products.delete_all
      
    #   flash[:notice] = "order has been placed."
    #   redirect_to products_path
    # else 
    #   redirect_to new_order_path
    #end

  end
  
    private
   
    def order_params
      params.require(:order).permit(:address, :city, :zipcode)
    end
  end