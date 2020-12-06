class RemoveGeoIdXYStructIdFromLocations < ActiveRecord::Migration[6.0]
  def change
    remove_column :locations, :geo_id, :integer
    remove_column :locations, :x, :float
    remove_column :locations, :y, :float
    remove_column :locations, :struct_id, :integer
  end
end
