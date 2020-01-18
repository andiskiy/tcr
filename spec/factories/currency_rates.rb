FactoryBot.define do
  factory :currency_rate do
    trait :usd do
      code { 840 }
      name { :usd }
      buy  { 59.95 }
      sell { 63.05 }
    end

    trait :eur do
      code { 978 }
      name { :eur }
      buy  { 66.5 }
      sell { 69.9 }
    end
  end
end
