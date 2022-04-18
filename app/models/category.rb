class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :menu_categories
  has_many :menu_items, through: :menu_categories
end
