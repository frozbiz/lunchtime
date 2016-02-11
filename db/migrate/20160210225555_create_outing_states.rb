class CreateOutingStates < ActiveRecord::Migration
  def change
    create_table :outing_states do |t|
      t.string :name
    end
  end
end
