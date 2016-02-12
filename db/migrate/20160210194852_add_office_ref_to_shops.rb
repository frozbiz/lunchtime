class AddOfficeRefToShops < ActiveRecord::Migration
  def change
    add_reference :shops, :office, index: true, foreign_key: true
  end
end
