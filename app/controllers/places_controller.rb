class PlacesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :premium_user?, only: [:create]

  expose(:users)
  expose(:user)
  expose_decorated(:places)
  expose_decorated(:place)
  respond_to :html

  def create
    place = Place.new(place_params)
    place.save
    respond_with(place)
  end

  def update
    place.update(place_params)
    respond_with(place)
  end

  def destroy
    place.destroy
    respond_with(place)
  end

  def add_to_visited
    begin
      current_user.places << place
      notice = 'Place added to visited'
    rescue ActiveRecord::RecordInvalid
      notice = "You can't mark place as visited twice"
    ensure
      redirect_to place_path, notice: notice
    end
  end

  private

    def premium_user?
      unless current_user.has_premium_account?
        redirect_to new_charge_path
        flash[:error] = "You aren't a premium user!"
      end
    end

    def place_params
      params.require(:place).permit(:name, :street, :city, :country, :description)
    end
end
