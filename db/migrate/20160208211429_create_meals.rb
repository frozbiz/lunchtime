class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.references :user
      t.references :shop
      t.string :order
      t.text :description
      t.decimal :rating, :precision => 2, :scale => 1
      t.decimal :price, :precision => 5, :scale => 2
      t.timestamps null: false
    end
  end
end
