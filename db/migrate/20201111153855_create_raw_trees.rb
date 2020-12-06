class CreateRawTrees < ActiveRecord::Migration[6.0]
  def change
    create_table :raw_trees do |t|
      t.integer :GEO_ID
      t.float :X
      t.float :Y
      t.integer :STRUCTID
      t.integer :ADDRESS
      t.string :name
      t.integer :DBH_TRUNK
      t.integer :TREE_POSIT
      t.string :COMMON_NAM
      t.string :BOTANICAL_
      t.point :geometry

      t.timestamps
    end
  end
end
