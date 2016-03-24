class OutingAddTimezone < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE outings ALTER COLUMN departure SET DATA TYPE TIMESTAMP WITH TIME ZONE;
    SQL
    add_column :offices, :tz, :string
  end
  def down
    execute <<-SQL
      ALTER TABLE outings ALTER COLUMN departure SET DATA TYPE TIMESTAMP WITHOUT TIME ZONE;
    SQL
    remove_column :offices, :tz
  end
end
