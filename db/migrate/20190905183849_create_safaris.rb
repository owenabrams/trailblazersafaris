class CreateSafaris < ActiveRecord::Migration[5.2]
  def change
    create_table :safaris do |t|
      t.string :banner_image
      t.string :title
      t.string :description
      t.string :itinerary_description
      t.string :price
      t.string :hotels_description
      t.string :includes_description

      t.timestamps
    end
  end
end
