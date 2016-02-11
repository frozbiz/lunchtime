class AddOutingsJoinTable < ActiveRecord::Migration
  def change
    create_table :outings_users, id: false do |t|
      t.belongs_to :outing, index: true
      t.belongs_to :user, index: true
    end
  end
end
