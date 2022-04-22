class Order < ApplicationRecord
  validates :status, inclusion: { in: %w[NEW PAID CANCELED] }
  validates :email, email: true
  
  has_many :order_details
  has_many :menu_items, through: :order_details

  after_create :calculate_total_price

  private

  def calculate_total_price
    prices = self.order_details.map do |order_detail| 
      order_detail.price * order_detail.quantity 
    end
    
    self.total_price = prices.sum
  end
end
