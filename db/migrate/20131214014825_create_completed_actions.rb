class CreateCompletedActions < ActiveRecord::Migration
  def change
    create_table :completed_actions do |t|
      t.integer :schedule_id, null: false
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
