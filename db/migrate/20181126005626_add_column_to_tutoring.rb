class AddColumnToTutoring < ActiveRecord::Migration[5.2]
  def change
    add_column :tutorings, :hour, :string
  end
end
