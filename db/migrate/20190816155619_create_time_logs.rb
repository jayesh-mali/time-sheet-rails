class CreateTimeLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :time_logs do |t|
      t.text :description
      t.decimal :hours, precision: 4, scale: 2, null: false
      t.date :date, null: false
      t.references :project, null: false, index: true
      t.references :created_by, foreign_key: { to_table: :users }, index: true
      t.references :updated_by, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
