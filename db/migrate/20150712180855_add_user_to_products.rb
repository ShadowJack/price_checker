class AddUserToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.belongs_to :user, index: true
    end
  end
end
