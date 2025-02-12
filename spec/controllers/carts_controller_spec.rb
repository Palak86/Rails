require 'rails_helper'
require_relative "../support/devise"

RSpec.describe CartsController, type: :controller do

  let!(:buyer) { create(:buyer) }
  let(:cart) { create(:cart, buyer: buyer) }
  before(:each) do
    # binding.pry
    login_buyer(buyer)
  end
  let!(:cart_items) do
    create(:cart_item, cart: cart, product: create(:product))
  end

  describe 'GET #show' do
    # binding.pry
    it 'assigns cart and cart_items' do
      get :show  
      expect(assigns(:cart)).to eq(cart)  
      expect(assigns(:cart_items)).to be_present  
    end
  end
end
