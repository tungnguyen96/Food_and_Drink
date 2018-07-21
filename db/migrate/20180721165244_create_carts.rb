class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :quantity
      t.references :user
      t.references :product

      t.timestamps
    end
  end
end
