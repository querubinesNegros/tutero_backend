class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.integer :age
      t.integer :stratus
      t.integer :pbm
      t.references :tutor, foreign_key: false

      t.timestamps
    end
  end
end
