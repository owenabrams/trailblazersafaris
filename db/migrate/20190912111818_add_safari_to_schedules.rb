class AddSafariToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_reference :schedules, :safari, foreign_key: true
  end
end
