class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :title
      t.integer :section_id
      t.text :body
      t.integer :order
      t.boolean :is_published
      t.boolean :menu_display

      t.timestamps
    end
  end
end
