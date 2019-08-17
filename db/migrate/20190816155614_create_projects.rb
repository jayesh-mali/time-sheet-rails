class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name, index: true, null: false
      t.references :manager, foreign_key: { to_table: :users }, index: true
      t.timestamps
    end
  end
end
