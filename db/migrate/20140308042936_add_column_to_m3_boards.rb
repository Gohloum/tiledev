class AddColumnToM3Boards < ActiveRecord::Migration
  def change
    add_column :m3_boards, :m3_level_id, :integer
  end
end
