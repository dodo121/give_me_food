require 'rails_helper'

RSpec.describe "Places", :type => :request do
  
  context "Signed in User" do
    
    before do
      user = create(:user) 
      @place = create(:place)
      sign_in_action user
    end
    
    describe "can" do
      it "add place to visited" do
        add_place_to_visited @place
      end
      
      it "can see place marked as visited" do
        add_place_to_visited @place
        visit places_path
        expect(page).to have_content("Visited")
      end
    
      it "can't mark place as visited twice" do
        add_place_to_visited @place
        expect(page).to have_content("You can't mark place as visited twice!")
      end
    
    end 
  end
end