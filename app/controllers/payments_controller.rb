require 'stripe'

class PaymentsController < ApplicationController
  before_action :set_cart

  def new
    @amount = @cart.total_price
  end

  def create
    begin
      
      customer = Stripe::Customer.create({
      name: current_buyer.name, 
      email: current_buyer.email,
      # metadata: {
      #   user_id: current_buyer.id
      # }
    })

      payment_intent = Stripe::PaymentIntent.create({
      amount: @cart.total_price,
      customer: customer.id,
      currency: 'usd',
      payment_method: params[:payment_method_id],
      confirmation_method: 'manual', 
      confirm: true,
      return_url: 'https://products',
      # metadata: {
      #   buyer_name: current_buyer.name 
      # }
    })

      if payment_intent.status == 'succeeded'
        @cart.update(status: 'paid')
        @cart.cart_items.destroy_all

        redirect_to products_path, notice: 'Payment successful!'
      else
        flash[:alert] = 'Payment failed. Please try again.'
        redirect_to payments_new_path
      end

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to payments_new_path
    end
  end

  private

  def set_cart
    @cart = current_buyer.cart
  end
end




