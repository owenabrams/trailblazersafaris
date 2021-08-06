class SafariAttractionsController < ApplicationController
  before_action :set_safari_attractions, only: [:show, :edit, :update, :destroy]

  def new
    @safari_attraction = SafariAttraction.new
  end

  def create
    @safari = Safari.find(params[:safari_id])
    safari_attraction_params[:attraction_id].reject(&:blank?).each do |id|
      @safari_attraction = SafariAttraction.new(attraction_id: id, safari: @safari)
      @safari_attraction.safari = @safari
      if SafariAttraction.where(safari: @safari, attraction_id: id).length < 1
        @safari_attraction.save
      end
    end
    if @safari_attraction.save
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

  def set_safari_attractions
    @safari_attraction = SafariAttraction.find(params[:id])
  end

  def safari_attraction_params
    params.require(:safari_attraction).permit(attraction_id: [])
  end
end
