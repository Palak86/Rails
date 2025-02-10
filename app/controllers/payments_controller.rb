require 'stripe'

class PaymentsController < ApplicationController
  before_action :set_cart

  def new
    @amount = @cart.total_price
  end

  def create
    begin
      payment_intent = Stripe::PaymentIntent.create({
        amount: @cart.total_price, 
        currency: 'usd',
        payment_method: params[:payment_method_id],
        confirmation_method: 'manual', 
        confirm: true,
        return_url: 'https://orders/new' 
      })

      if payment_intent.status == 'succeeded'
        @cart.update(status: 'paid')
        redirect_to  new_order_path(@cart), notice: 'Payment successful!'
      else
        flash[:alert] = 'Payment failed. Please try again.'
        redirect_to new_payment_path
      end

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_payment_path
    end
  end

  private

  def set_cart
    @cart = current_buyer.cart
  end
end
