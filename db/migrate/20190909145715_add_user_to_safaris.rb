class AddUserToSafaris < ActiveRecord::Migration[5.2]
  def change
    add_reference :safaris, :user, foreign_key: true
  end
end
