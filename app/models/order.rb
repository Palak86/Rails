class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :buyer
  has_many :cart_items, through: :cart
  has_many :products, through: :cart_items
  validates :address, :city, :zipcode, presence: true

end
