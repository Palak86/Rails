require 'rails_helper'
RSpec.describe Buyer, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:phone_number) }
  end
  describe "associations" do
    it { should have_many(:orders) }
    it { should have_one(:cart) }
  end
end
