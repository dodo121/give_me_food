FactoryGirl.define do 
  factory :user do
    sequence(:email) { |n| "johndoe#{n}@example.com" }
    password 'pass1234'
    factory :user2
  end 
end