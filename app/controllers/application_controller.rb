class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
#   before_action :authenticated?, :current_buyer, :current_cart
  
#   def current_buyer 
    
#     if session[:buyer_id]
# debugger
      
#       @buyer = Buyer.find(session [:buyer_id]) 
#     end 
#   end 
 
#   def current_cart
    
#     if login? 
#       @cart= @buyer.cart 
#     else 
#       if session[:cart] 
#         @cart= Cart.find(session[:cart]) 
#       else 
#         @cart= Cart.create 
#         session[:cart] = @cart.id 
#       end 
#     end 
#   end 
  
#   def login?
#     !!current_buyer
#   end 

#   def authenticated?
#     redirect_to new_buyer_session_path unless login?
#   end

#   def shove_cards_from_guest_to_user_account 
#     if session[:cart] 
#       guest_cart = Cart.find(session[:cart]) 
#       guest_cart.products.each { | card | ProductsCart.create(cart_id: current_cart.id, product_id: product.id)} 
#       ProductsCart.where(cart_id: guest_cart.id).delete_all 
#       guest_cart.destroy 
#       session[:cart] = nil 
#     end 
#   end
end
