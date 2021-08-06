class AddExpectToSafaris < ActiveRecord::Migration[5.2]
  def change
    add_column :safaris, :expect, :string
  end
end
