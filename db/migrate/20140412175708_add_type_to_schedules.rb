class AddTypeToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :type, :string
  end
end
