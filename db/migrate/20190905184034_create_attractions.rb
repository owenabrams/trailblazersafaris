class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :image
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
