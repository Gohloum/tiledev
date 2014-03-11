class CreateM3Boards < ActiveRecord::Migration
  def change
    create_table :m3_boards do |t|
      t.string :name
      t.text :data

      t.timestamps
    end
  end
end
