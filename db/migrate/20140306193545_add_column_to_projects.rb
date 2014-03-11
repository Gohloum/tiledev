class AddColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :game_type_id, :integer
  end
end
