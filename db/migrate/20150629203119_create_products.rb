class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :url
      t.integer :price
      t.integer :aim_price
      t.string :description

      t.timestamps null: false
    end
  end
end
