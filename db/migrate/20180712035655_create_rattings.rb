class CreateRattings < ActiveRecord::Migration[5.2]
  def change
    create_table :rattings do |t|
      t.integer :value
      t.text :content
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
