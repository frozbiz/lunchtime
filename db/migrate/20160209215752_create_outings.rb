class CreateOutings < ActiveRecord::Migration
  def change
    create_table :outings do |t|
      t.belongs_to :user, null: false
      t.belongs_to :shop, null: false
      t.datetime :departure, null: false
      t.string :comment, length: 255
      t.timestamps null: false
    end
  end
end
