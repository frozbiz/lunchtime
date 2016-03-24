class DropOutingStatesTable < ActiveRecord::Migration
  def change
    drop_table :outing_states do |t|
      t.string :name, null: false
    end
  end
end
