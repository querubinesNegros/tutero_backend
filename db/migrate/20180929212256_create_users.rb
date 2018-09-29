class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :cellphone
      t.references :career, foreign_key: false
      t.references :userable, polymorphic: true

      t.timestamps
    end
  end
end
