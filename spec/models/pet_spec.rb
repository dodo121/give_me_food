require 'rails_helper'

describe Pet do
  it "is invalid without name" do
    expect( FactoryGirl.build(:pet, name:nil) ).not_to be_valid
  end
  it "calculates life time" do
    expect( FactoryGirl.create(:pet, date_of_birth: Date.today - 10.day).life_time).to eq 10
  end
end