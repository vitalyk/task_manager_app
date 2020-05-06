class AddTargetDateToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :target_date, :datetime
  end
end
