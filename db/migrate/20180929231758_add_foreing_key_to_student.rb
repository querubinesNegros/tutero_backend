class AddForeingKeyToStudent < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :students, :tutors
  end
end
