class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :description, limit: 140
      t.string :phone, limit: 10
      t.references :owner, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
