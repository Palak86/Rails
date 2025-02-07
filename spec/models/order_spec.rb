require 'rails_helper'
RSpec.describe Order, type: :model do
  describe "validations" do
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:zipcode) }
  end
  describe "associations" do
    it { should belong_to(:buyer) }
    it { should belong_to(:cart) }
    it { should have_many(:products) }
  end
end
