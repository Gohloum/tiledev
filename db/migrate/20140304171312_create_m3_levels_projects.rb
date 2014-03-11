class CreateM3LevelsProjects < ActiveRecord::Migration
  def change
    create_table :m3_levels_projects do |t|
      t.references :m3_level
      t.references :project
    end
  end

  def self.down
    drop_table :m3_levels_projects
  end

end
