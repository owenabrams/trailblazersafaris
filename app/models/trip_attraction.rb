class TripAttraction < ApplicationRecord
  belongs_to :trip
  belongs_to :attraction
end
