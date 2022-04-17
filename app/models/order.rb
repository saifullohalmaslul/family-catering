class Order < ApplicationRecord
  validates :status, inclusion: { in: %w[NEW PAID CANCELED] }
end
