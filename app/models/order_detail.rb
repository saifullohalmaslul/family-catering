class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

  before_save :save_price

  private

  def save_price
    self.price = self.menu_item.price
  end
end
