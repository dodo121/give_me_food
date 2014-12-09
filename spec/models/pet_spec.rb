require 'rails_helper'

describe Pet do
  it "has valid factory" do
    expect( create(:pet) ).to be_valid
  end
  it "has user as parent" do
    @pet = create(:pet)
    @user = create(:user)
    expect(@pet.user.email).to eq @user.email
  end
  it "is invalid without name" do
    expect( build(:pet, name:nil) ).not_to be_valid
  end
  it "calculates life time" do
    expect( create(:pet, date_of_birth: Date.today - 10.day).life_time).to eq 10
  end
end
