class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, limit: 100
      t.integer :price
      t.integer :quantity
      t.text :detail
      t.integer :rate_average
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
