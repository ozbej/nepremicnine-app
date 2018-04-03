class AddImageToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :image, :string
  end
end
