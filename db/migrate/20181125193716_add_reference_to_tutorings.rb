class AddReferenceToTutorings < ActiveRecord::Migration[5.2]
  def change
    add_reference :tutorings, :tutor
  end
end
