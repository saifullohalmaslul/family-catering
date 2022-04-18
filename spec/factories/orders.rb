FactoryBot.define do
  factory :order do
    status { "NEW" }
    email { "halo@example.com" }
    total_price { 120_000.59 }

    factory :order_with_menu_items do
      menu_items { [association(:menu_item_with_categories)] }
    end
  end
end
