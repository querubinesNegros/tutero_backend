class RemoveIndexFromStudent < ActiveRecord::Migration[5.2]
  def change
    remove_index :students , :tutor_id
  end
end
