class CreatePriceHistories < ActiveRecord::Migration
  def change
    create_table :price_histories do |t|
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
