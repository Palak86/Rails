require 'rails_helper'
RSpec.describe Cart, type: :model do
  describe "associations" do
    it { should belong_to(:buyer) }
    it { should have_many(:products) }
    it { should have_many(:cart_items) }
    it { should have_many(:orders) }
  end
end
