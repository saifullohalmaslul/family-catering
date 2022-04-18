class MenuItem < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
  validates :description, length: { maximum: 150 }
  validates :categories, presence: true

  has_many :menu_categories
  has_many :categories, through: :menu_categories
end
