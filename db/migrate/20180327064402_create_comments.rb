class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :place_id
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
