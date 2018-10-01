class CreateJoinTableStudentsSchedule < ActiveRecord::Migration[5.2]
  def change
    create_join_table :students, :schedules do |t|
      t.references :student, foreign_key: true
      t.references :schedule, foreign_key: true
    end
  end
end
