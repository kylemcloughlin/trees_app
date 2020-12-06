class RemoveAddressFromLocations < ActiveRecord::Migration[6.0]
  def change
    remove_column :locations, :address, :integer
  end
end
