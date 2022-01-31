class ChangeMarkersTypesTable < ActiveRecord::Migration[5.2]
  def change
    rename_table 'markers_types', 'marker_types'
    add_column :marker_types, :id, :primary_key
  end
end
