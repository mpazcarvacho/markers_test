class ChangeCategoriesMarkersTable < ActiveRecord::Migration[5.2]
  def change
    rename_table 'categories_markers', 'category_markers'
    add_column :category_markers, :id, :primary_key
  end
end
