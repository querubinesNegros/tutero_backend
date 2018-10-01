class CreateJoinTableTutorsSchedule < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tutors, :schedules do |t|
      t.references :tutor, foreign_key: true
      t.references :schedule, foreign_key: true
    end
  end
end
