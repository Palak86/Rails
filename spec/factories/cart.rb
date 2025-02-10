FactoryBot.define do
  factory :cart do
    status { 'active' }
    association :buyer
  end
end
