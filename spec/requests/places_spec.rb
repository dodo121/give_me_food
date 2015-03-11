require 'rails_helper'

RSpec.describe "Places", :type => :request do

  describe "Signed in User" do
    let!(:user) { create(:user) }
    let!(:place) { create(:place) }

    before do
      sign_in_action user
    end

    context "can" do
      it "add place to visited and increment place users by 1" do
        expect {
          add_place_to_visited place
        }.to change(place.users, :count).by(1)
      end

      it "see place marked as visited" do
        add_place_to_visited place
        visit places_path
        expect(page).to have_content("Visited")
      end
    end

    context "can't" do
      it "mark place as visited twice" do
        add_place_to_visited place
        expect {
          add_place_to_visited place
        }.to change(place.users, :count).by(0)
        expect(page).to have_content("You can't mark place as visited twice")
      end
    end
  end
end
