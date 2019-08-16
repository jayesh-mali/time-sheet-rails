class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name, index: true, null: false
      t.string :project_manager, index: true, null: false
      t.timestamps
    end
  end
end
