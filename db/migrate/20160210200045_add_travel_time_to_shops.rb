class AddTravelTimeToShops < ActiveRecord::Migration
  def change
    add_column :shops, :time_seconds, :integer
    add_column :shops, :time_text, :string
  end
end
