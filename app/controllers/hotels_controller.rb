class HotelsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  def index
    @hotel = Hotel.all
  end

  def show
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    @hotel.user = current_user
    if @hotel.save
      redirect_to hotel_path(@hotel)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @hotel.update(hotel_params)
      redirect_to hotel_path(@hotel)
    else
      flash[:error] = 'Didn\'t save'
    end
  end

  def destroy
    @hotel.destroy
    redirect_to hotels_path
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  def hotel_params
    params.require(:hotel).permit( :title, :description, :price_night, :image)
  end
end
