FactoryBot.define do
  factory :order do
    email { "halo@example.com" }

    factory :order_with_menu_items do
      menu_items { [association(:menu_item)] }
    end
  end

  factory :invalid_order, parent: :order do
    status { "INVALID" }
    email { "invalid@mail" }
  end
end
