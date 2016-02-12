class AddDistanceToShops < ActiveRecord::Migration
  def change
    add_column :shops, :distance_meters, :float
    add_column :shops, :distance_text, :string
  end
end
