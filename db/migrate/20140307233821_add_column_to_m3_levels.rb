class AddColumnToM3Levels < ActiveRecord::Migration
  def change
    add_column :m3_levels, :m3_board_id, :integer
  end
end
