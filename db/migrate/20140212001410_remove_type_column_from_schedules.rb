class RemoveTypeColumnFromSchedules < ActiveRecord::Migration
  def change
    remove_column :schedules, :type
  end
end
