FactoryBot.define do
  factory :order do
    email { "halo@example.com" }
    total_price { 120_000.59 }

    factory :order_with_menu_items do
      menu_items { [association(:menu_item)] }
    end
  end

  factory :invalid_order, parent: :order do
    status { "INVALID" }
    email { "invalid@mail" }
  end
end
