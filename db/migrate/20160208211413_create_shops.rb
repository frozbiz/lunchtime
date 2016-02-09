class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.references :user
      t.string :name
      t.string :address
      t.string :phone
      t.string :office
      t.float :avg_rating
      t.decimal :avg_price, :precision => 5, :scale => 2
      t.timestamps null: false
    end
  end
end
