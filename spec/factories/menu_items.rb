FactoryBot.define do
  factory :menu_item do
    name { Faker::Food.dish }
    price { 10_000.00 }
    description { "This is the default description" }

    factory :menu_item_with_categories do
      categories { [association(:category)] }
    end
  end
end
