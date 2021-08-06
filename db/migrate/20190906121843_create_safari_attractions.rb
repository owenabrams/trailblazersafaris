class CreateSafariAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :safari_attractions do |t|
      t.references :safari, foreign_key: true
      t.references :attraction, foreign_key: true

      t.timestamps
    end
  end
end
