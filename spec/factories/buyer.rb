FactoryBot.define do
  factory :buyer do
    email { 'sdfhkjki@gmail.com' }
    password { 'password' }
    password_confirmation { 'password' }
    name { 'Palak' }
    address { 'xyz sai kripa' }
    phone_number { 7898680620 }
    role {'buyer'}

    trait :with_custom_email do
      email { 'custom_email@example.com' }
      password { 'password' }
    end

  end
end
