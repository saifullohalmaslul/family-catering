class Order < ApplicationRecord
  validates :status, inclusion: { in: %w[NEW PAID CANCELED] }
  validates :email, email: true
  
  has_many :order_details
  has_many :menu_items, through: :order_details

  accepts_nested_attributes_for :order_details

  after_save :calculate_total_price

  private

  def calculate_total_price
    total_price = self.order_details.sum do |order_detail| 
      order_detail.price * order_detail.quantity 
    end
    
    self.total_price = total_price
  end
end
