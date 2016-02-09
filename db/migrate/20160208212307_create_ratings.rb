class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :user
      t.references :shop
      t.text :comment
      t.integer :rating
      t.timestamps null: false
    end
  end
end
