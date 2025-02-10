require 'rails_helper'

RSpec.describe CartsController, type: :controller do

  let(:buyer) { create(:buyer) }
  let(:cart) { create(:cart, buyer: buyer) }

  before do
    sign_in buyer 
  end

  let!(:cart_items) do
    create(:cart_item, cart: cart, product: create(:product))
  end

  describe 'GET #show' do
    it 'assigns @cart and @cart_items' do
      get :show  
      expect(assigns(:cart)).to eq(cart)  
      expect(assigns(:cart_items)).to be_present  
    end
  end
end
