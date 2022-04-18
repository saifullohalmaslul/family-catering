FactoryBot.define do
  factory :menu_item do
    name { "MyString" }
    price { 1.5 }
    description { "MyText" }

    factory :menu_item_with_categories do
      categories { [association(:category)] }
    end
  end
end
