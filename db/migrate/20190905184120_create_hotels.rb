class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.string :title
      t.string :description
      t.string :price_night

      t.timestamps
    end
  end
end
