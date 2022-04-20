class Order < ApplicationRecord
  validates :status, inclusion: { in: %w[NEW PAID CANCELED] }
  validates :email, email: true
  
  has_many :order_details
  has_many :menu_items, through: :order_details
end
