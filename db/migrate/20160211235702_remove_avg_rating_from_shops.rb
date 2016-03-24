class RemoveAvgRatingFromShops < ActiveRecord::Migration
  def change
    remove_column :shops, :avg_rating, :float
  end
end
