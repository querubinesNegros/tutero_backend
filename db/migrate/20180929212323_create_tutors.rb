class CreateTutors < ActiveRecord::Migration[5.2]
  def change
    create_table :tutors do |t|
      t.integer :ammountStudents

      t.timestamps
    end
  end
end
