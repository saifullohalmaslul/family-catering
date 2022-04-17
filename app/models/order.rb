class Order < ApplicationRecord
  validates :status, inclusion: { in: %w[NEW PAID CANCELED] }
  has_many :order_details
end
