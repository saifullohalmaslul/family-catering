FactoryBot.define do
  factory :menu_item do
    name { Faker::Food.unique.dish }
    price { 10_000.00 }
    description { "This is the default description" }

    factory :menu_item_with_categories do
      categories { [association(:category)] }
    end
  end

  factory :menu_item_without_name, parent: :menu_item do
    name { nil }
  end
end
