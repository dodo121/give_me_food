require 'rails_helper'

describe PetsController, :type => :controller do
  describe 'pet owner authorization' do
    
    context 'gives true pet owner permissions' do
      before(:each) do
        @pet = create(:pet)
        sign_in @pet.user
      end
      
      describe 'action GET #edit' do
        it 'is succesfull' do
          get :edit, id: @pet
          expect(response).to be_success
        end
      end
      
      describe 'action DELETE #destroy' do
        it 'changes counter by -1' do
          expect{
            delete :destroy, id: @pet
          }.to change(Pet, :count).by(-1)
        end
      end
    end
    
    context "doesn't give fake pet owner permissions" do
      before(:each) do
        @pet = create(:pet)
        @user2 = create(:user)
        sign_in @user2
      end
      
      describe 'action GET #edit' do
        it 'redirects to root_path' do
          get :edit, id: @pet
          expect(response).to redirect_to root_path
        end
      end
      describe 'action DELETE #destroy' do
        it 'redirects to root_path' do
          delete :destroy, id: @pet
          expect(response).to redirect_to root_path
        end
      end
    end
  end
end
  