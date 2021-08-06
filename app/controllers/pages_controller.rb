class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :privacy, :about, :contact, :reviews, :preparation]

  def home
    @safaris = Safari.all
    @user = current_user
  end

  def contact
    @markers =
      {
        lat: 0.339600,
        lng: 32.604260
      },
      {
        lat: 0.210320,
        lng: 32.541500
      }
  end
end
