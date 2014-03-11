class CreateM3Levels < ActiveRecord::Migration
  def change
    create_table :m3_levels do |t|
      t.string :name
      t.text :data
      t.integer :active
      t.integer :order
      t.text :icons

      t.timestamps
    end
  end
end
