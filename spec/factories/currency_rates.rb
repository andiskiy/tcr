FactoryBot.define do
  factory :currency_rate do
    code { 840 }
    name { :usd }
    buy  { 59.95 }
    sell { 63.05 }
  end
end
