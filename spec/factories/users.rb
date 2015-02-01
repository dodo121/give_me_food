FactoryGirl.define do 
  factory :user do
    sequence(:username) { |n| "johndoe#{n}"}
    sequence(:email) { |n| "johndoe#{n}@example.com" }
    password 'pass1234'
    factory :user2
  end 
end