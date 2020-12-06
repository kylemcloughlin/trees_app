class AddTotalToDiameters < ActiveRecord::Migration[6.0]
  def change
    add_column :diameters, :total, :integer
  end
end
