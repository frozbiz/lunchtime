class AddOutingStateToOutings < ActiveRecord::Migration
  def change
    add_column :outings, :outing_state, :string
  end
end
