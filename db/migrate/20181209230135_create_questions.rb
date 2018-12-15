class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :content
      t.references :student, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
