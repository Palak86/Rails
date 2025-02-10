require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let(:buyer) { create(:buyer) }
  let(:cart) { create(:cart, buyer: buyer) }

  before do
    sign_in buyer 
  end

  # let!(:cart_items) do
  #   create(:cart_item, cart: cart, product: create(:product))
  #   create(:cart_item, cart: cart, product: create(:product))
  #   create(:cart_item, cart: cart, product: create(:product))
  # end

  

  describe 'GET #show' do
    it 'assigns @cart and @cart_items' do
      get :show  # Send a GET request to the show action
      expect(assigns(:cart)).to eq(cart)  # Check if @cart is assigned correctly
      expect(assigns(:cart_items)).to be_present  # Ensure @cart_items is assigned
    end
  end
end
