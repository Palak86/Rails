class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, format: { with: /\A[789]\d{9}\z/, message: "must be a 10-digit number starting with 7, 8, or 9" }
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  enum :role, [:buyer, :admin]
end
