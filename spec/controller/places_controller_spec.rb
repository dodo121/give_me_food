require 'rails_helper'

describe PlacesController, type: :controller do
  
  describe 'action POST #add_to_visited' do
    
    before(:each) do
      @user = create(:user)
      @place = create(:place)
      sign_in @user
    end
    
    it 'changes Place users count by 1' do
      expect{
        post :add_to_visited, id: @place
      }.to change(@place.users, :count).by(1)
    end
  end
end