FactoryBot.define do
  factory :order_detail do
    order
    menu_item
  end
end
