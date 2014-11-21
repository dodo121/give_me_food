FactoryGirl.define do
  factory :pet do
    name 'Rex'
    association :user
  end
end