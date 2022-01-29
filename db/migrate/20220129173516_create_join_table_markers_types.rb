class CreateJoinTableMarkersTypes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :markers, :types do |t|
      t.index [:marker_id, :type_id]
      t.index [:type_id, :marker_id]
    end
  end
end
