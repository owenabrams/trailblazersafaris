class SchedulesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.all
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @safari = Safari.find(params[:safari_id])
    @schedule = Schedule.new(schedule_params)
    @schedule.safari = @safari
    if @schedule.save
      redirect_to safaris_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedule_path(@schedule)
    else
      flash[:error] = 'Didn\'t save'
    end
  end

  def destroy
    safari = @schedule.safari
    @schedule.destroy
    redirect_to safari_path(safari)
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit( :title, :description )
  end
end
