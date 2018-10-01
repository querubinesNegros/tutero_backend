class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :class_post, foreign_key: true
      t.references :admin, foreign_key: true
      t.string :name
      t.text :description
      t.string :addreessedTo

      t.timestamps
    end
  end
end
