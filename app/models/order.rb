class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :buyer
  has_many :cart_items, through: :cart
  has_many :products, through: :cart_items
  validates :address, presence: true
  validates :city, presence: true
  validates :zipcode, presence: true, format: { with: /\A\d{6}\z/, message: "must be a 6-digit number" }

end
