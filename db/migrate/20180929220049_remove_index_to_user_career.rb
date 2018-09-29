class RemoveIndexToUserCareer < ActiveRecord::Migration[5.2]
  def change
    remove_index :users , :career_id
  end
end
