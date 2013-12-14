class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :user_id, null: false
      t.string :type, null: false
      t.decimal :price, precision: 8, scale: 2
      t.string :comparison, null: false
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end
