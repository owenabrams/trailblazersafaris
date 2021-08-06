class AttractionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index
    @attractions = Attraction.all
  end

  def show
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.user = current_user
    if @attraction.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      flash[:error] = 'Didn\'t save'
    end
  end

  def destroy
    @attraction.destroy
    redirect_to attractions_path
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    attractionParams = params.require(:attraction).permit(:image, :title, :description)
  end
end
