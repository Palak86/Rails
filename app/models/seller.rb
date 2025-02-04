class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :company_name, presence: true
  validates :name, presence: true
  validates :company_description, presence: true
  validates :gst_number, presence: true
  validates :phone_number, presence: true
end
