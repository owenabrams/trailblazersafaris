class SafariHotelsController < ApplicationController
  before_action :set_safari_hotels, only: [:show, :edit, :update, :destroy]

  def new
    @safari = Safari.find(params[:id])
    @safari_hotel = SafariHotel.new
  end

  def create
    @safari = Safari.find(params[:safari_id])
    safari_hotel_params[:hotel_id].reject(&:blank?).each do |id|
      @safari_hotel = SafariHotel.new(hotel_id: id, safari: @safari)
      @safari_hotel.safari = @safari
      if SafariHotel.where(safari: @safari, hotel_id: id).length < 1
        @safari_hotel.save
      end
    end
    if @safari_hotel.save
      redirect_to safaris_path
    else
      render :new
    end
  end

  def destroy
    @safari_hotel.destroy
    redirect_to safaris_path
  end

  private

  def set_safari_hotels
    @safari_hotel = SafariHotel.find(params[:id])
  end

  def safari_hotel_params
    params.require(:safari_hotel).permit(hotel_id: [])
  end
end
