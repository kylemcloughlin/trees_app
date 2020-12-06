class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.integer :address
      t.string :name
      t.integer :geo_id
      t.float :x
      t.float :y
      t.integer :struct_id

      t.timestamps
    end
  end
end
