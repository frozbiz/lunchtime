class RemoveOfficeFromShops < ActiveRecord::Migration
  def change
    remove_column :shops, :office, :string
  end
end
