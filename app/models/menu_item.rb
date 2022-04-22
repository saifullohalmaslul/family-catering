class MenuItem < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
  validates :description, length: { maximum: 150 }
  validates :categories, presence: true

  has_many :menu_categories
  has_many :categories, through: :menu_categories

  def category_names
    self.categories.map{ |category| category.name }.join(", ")
  end

  def category_names=(new_categories)
    category_names = new_categories.split(/,\s+/) 

    self.categories = []
    category_names.each do |category_name|
      self.categories << Category.find_or_create_by(name: category_name)
    end
  end
end
