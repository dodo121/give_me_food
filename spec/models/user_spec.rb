require 'rails_helper'

describe User do
  it "has a valid factory" do
    expect( FactoryGirl.create(:user) ).to be_valid
  end
  it "is invalid without a email" do
    expect( FactoryGirl.build(:user, email: nil) ).not_to be_valid
  end
  it "is invalid without password" do
    expect( FactoryGirl.build(:user, password: nil)).not_to be_valid
  end
  it "has unique email adress" do
    FactoryGirl.create(:user, email: 'johndoe1@gmail.com')
    expect( FactoryGirl.build(:user, email: 'johndoe1@gmail.com') ).not_to be_valid
  end
end