class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.belongs_to :product, index: true
      t.integer :price

      t.timestamps
    end
  end
end
