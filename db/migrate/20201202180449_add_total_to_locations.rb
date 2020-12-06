class AddTotalToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :total, :integer
  end
end
