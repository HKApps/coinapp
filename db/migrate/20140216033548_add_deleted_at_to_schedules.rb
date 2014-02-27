class AddDeletedAtToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :deleted_at, :datetime
  end
end
