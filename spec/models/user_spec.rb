require 'rails_helper'

describe User do
  it "has a valid factory" do
    expect( create(:user) ).to be_valid
  end
  it "is invalid without a email" do
    expect( build(:user, email: nil) ).not_to be_valid
  end
  it "is invalid without password" do
    expect( build(:user, password: nil)).not_to be_valid
  end
  it "has unique email adress" do
    create(:user, email: 'johndoe1@gmail.com')
    expect( build(:user, email: 'johndoe1@gmail.com') ).not_to be_valid
  end
end