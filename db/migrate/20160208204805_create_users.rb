class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :mobile_phone
      t.string :sonos_id
      t.string :sonos_household_id
      t.timestamps null: false
    end
  end
end
