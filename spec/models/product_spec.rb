require 'rails_helper'
RSpec.describe Product, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:stock) }
  end
  describe "associations" do
    it { should belong_to(:category) }
    it { should have_many(:cart_items) }
    it { should have_many(:carts) }
  end
end
