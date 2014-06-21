class AddUtcSecondsForDisplay < ActiveRecord::Migration
  def change
    add_column :statuses, :utc_seconds, :integer
  end
end
