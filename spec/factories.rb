FactoryGirl.define do
  factory :comment do
    
  end
  factory :post do
    user
    title { Faker::Name.name }
    content { Faker::Lorem.paragraph }
  end
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end