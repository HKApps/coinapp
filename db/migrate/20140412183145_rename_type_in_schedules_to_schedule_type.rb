class RenameTypeInSchedulesToScheduleType < ActiveRecord::Migration
  def change
    rename_column :schedules, :type, :schedule_type
  end
end
