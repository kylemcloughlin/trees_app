class CreateDiameters < ActiveRecord::Migration[6.0]
  def change
    create_table :diameters do |t|
      t.integer :dbh_trunk

      t.timestamps
    end
  end
end
