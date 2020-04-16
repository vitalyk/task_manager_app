class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :name
      t.boolean :status
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tasks, [:project_id, :created_at]
  end
end
