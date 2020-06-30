class CreateIceCreams < ActiveRecord::Migration
  def change
    create_table :ice_creams do |t|
      t.string :flavore
      t.integer :rating
      t.string :toppings
      t.references :user
    end
  end
end
