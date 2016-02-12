class RemoveRatingFromMeals < ActiveRecord::Migration
  def change
    remove_column :meals, :rating, :decimal
  end
end
