class PetsController < ApplicationController
  
  expose_decorated(:pet, attributes: :pet_params)
  expose_decorated(:pets)
  #before_action :authenticate_user!
  before_action :check_owner, only: [:edit, :destroy]

  def create
    pet = Pet.new(pet_params)
    pet.user = current_user
    respond_to do |format|
      if pet.save
        format.html { redirect_to pet, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: pet }
      else
        format.html { render :new }
        format.json { render json: pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if pet.update(pet_params)
        format.html { redirect_to pet, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: pet }
      else
        format.html { render :edit }
        format.json { render json: pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :date_of_birth)
    end
    
    def check_owner
      if pet.user != current_user
        redirect_to root_path, notice: 'This is not your pet!'
      end
    end
end
