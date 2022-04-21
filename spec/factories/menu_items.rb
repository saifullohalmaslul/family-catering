FactoryBot.define do
  factory :menu_item do
    sequence(:name) { |n| Faker::Food.dish + " #{n}"}
    price { 10_000.00 }
    description { "This is the default description" }

    factory :menu_item_with_categories do
      categories { [association(:category)] }
    end
  end

  factory :invalid_menu_item, parent: :menu_item do
    name { nil }
    price { nil }
  end
end
