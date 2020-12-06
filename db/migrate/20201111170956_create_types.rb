class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string :common_name
      t.string :botanical_name

      t.timestamps
    end
  end
end
