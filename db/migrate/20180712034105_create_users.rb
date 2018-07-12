class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 50
      t.string :email, limit: 100
      t.string :address
      t.string :password, limit: 100
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
