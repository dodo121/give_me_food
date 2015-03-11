require 'rails_helper'
require 'shoulda/matchers'

describe User do
  it "has a valid factory" do
    expect( create(:user) ).to be_valid
  end

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }

  describe '.has_premium_account?' do
    it 'returns true if user has active premium account' do
      expect( create(:user, premium_expiry_date: Time.now + (2*7*24*60*10)).has_premium_account? ).to be(true)
    end
    it 'returns false if user premium account exipred' do
      expect( create(:user, premium_expiry_date: Time.now - (2*7*24*60*10)).has_premium_account? ).to be(false)
    end
  end

  describe '.make_premium' do
    Timecop.freeze
    let(:user){ create(:user) }

    before do
      user.make_premium(1)
    end

    it 'sets User premium_expiry_date' do
      expect( user.premium_expiry_date ).to eq(Time.now + 1.month)
    end
  end
end
