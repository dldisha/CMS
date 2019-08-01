class AddFeaturedToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :featured, :boolean
  end
end
