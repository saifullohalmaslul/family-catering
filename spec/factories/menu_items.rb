FactoryBot.define do
  factory :menu_item do
    sequence(:name) { |n| Faker::Food.dish + " #{n}"}
    price { 10_000.00 }
    description { "This is the default description" }
    category_names { "American, Chicken" }
  end

  factory :invalid_menu_item, parent: :menu_item do
    name { nil }
    price { nil }
  end
end
