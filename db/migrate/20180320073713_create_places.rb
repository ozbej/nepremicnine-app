class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :ime
      t.text :opis
      t.string :lokacija
      t.string :kraj

      t.timestamps
    end
  end
end
