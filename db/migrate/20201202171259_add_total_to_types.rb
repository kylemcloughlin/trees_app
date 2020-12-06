class AddTotalToTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :types, :total, :integer
  end
end
