FactoryBot.define do
  factory :order do
    status { "MyString" }
    email { "MyString" }
    total_price { 1.5 }
  end
end
