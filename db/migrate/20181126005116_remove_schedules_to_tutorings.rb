class RemoveSchedulesToTutorings < ActiveRecord::Migration[5.2]
  def change
    remove_column :tutorings , :schedule_id
  end
end
