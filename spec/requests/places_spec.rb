require 'rails_helper'

RSpec.describe "Places", :type => :request do
  
  describe "User" do
    
    before do
      @user = create(:user)
      @place = create(:place)
    end
    
    it "adds place to visited" do
      visit root_path
      click_link 'sign in'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      
      visit places_path
      click_link 'Show'
      expect(current_path).to eq place_path(@place) 
      expect {
        click_link 'Add to visited', @place
      }.to change(@place.users, :count).by(1)
      
      expect(current_path).to eq place_path(@place)
    end
  end
end
