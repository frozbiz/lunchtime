class RemoveOutingStateRefFromOutings < ActiveRecord::Migration
  def change
    remove_reference :outings, :outing_state, index: true, foreign_key: true
  end
end
