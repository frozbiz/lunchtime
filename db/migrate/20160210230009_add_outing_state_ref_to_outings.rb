class AddOutingStateRefToOutings < ActiveRecord::Migration
  def change
    add_reference :outings, :outing_state, index: true, foreign_key: true
  end
end
