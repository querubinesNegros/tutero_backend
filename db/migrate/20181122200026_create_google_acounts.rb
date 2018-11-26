class CreateGoogleAcounts < ActiveRecord::Migration[5.2]
  def change
    create_table :google_acounts do |t|
      t.string :email

      t.timestamps
    end
  end
end
