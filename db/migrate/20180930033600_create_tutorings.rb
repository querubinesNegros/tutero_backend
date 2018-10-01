class CreateTutorings < ActiveRecord::Migration[5.2]
  def change
    create_table :tutorings do |t|
      t.references :topic, foreign_key: true
      t.string :type_t
      t.references :schedule, foreign_key: true
      t.integer :duration
      t.text :noteStudent
      t.text :noteTutor
      t.references :student, foreign_key: true
      t.date :date
      t.integer :score
      t.text :review

      t.timestamps
    end
  end
end
