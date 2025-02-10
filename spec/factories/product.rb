FactoryBot.define do
  factory :product do
    name { 'lipstick red' }
    price { 199 }
    stock { 19 }
    description { 'smotch proof' }
    association :category
  end
end
