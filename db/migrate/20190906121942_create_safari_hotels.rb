class CreateSafariHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :safari_hotels do |t|
      t.references :safari, foreign_key: true
      t.references :hotel, foreign_key: true

      t.timestamps
    end
  end
end
