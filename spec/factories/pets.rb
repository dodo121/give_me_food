FactoryGirl.define do
  factory :pet do
    name 'Rex'
    date_of_birth '2014-10-10'
    user
  end
end