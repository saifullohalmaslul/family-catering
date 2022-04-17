FactoryBot.define do
  factory :order do
    status { "NEW" }
    email { "halo@example.com" }
    total_price { 120_000.59 }
  end
end
