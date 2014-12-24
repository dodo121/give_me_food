class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  
  expose(:users)
  expose(:user)
  expose_decorated(:places)
  expose_decorated(:place)
  respond_to :html

  def index
    places = Place.all
    respond_with(places)
  end

  def show
    respond_with(place)
  end

  def new
    place = Place.new
    respond_with(place)
  end

  def edit
  end

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
    def set_place
      place = Place.find(params[:id])
    end

    def place_params
      params.require(:place).permit(:street, :city, :country)
    end
end
