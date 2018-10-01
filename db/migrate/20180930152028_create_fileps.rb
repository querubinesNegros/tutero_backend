class CreateFileps < ActiveRecord::Migration[5.2]
  def change
    create_table :fileps do |t|
      t.references :filepable, polymorphic: true
      t.string :name

      t.timestamps
    end
  end
end
