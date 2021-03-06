class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :section_id
      t.integer :admin_user_id
      t.string :title
      t.boolean :is_done
      t.date :due_date

      t.timestamps
    end
  end
end
