class CreateIceCreams < ActiveRecord::Migration
  def change
    create_table :ice_cream do |t|
      t.string :flavore
      t.integer :rating
      t.string :toppings
    end
  end
end
