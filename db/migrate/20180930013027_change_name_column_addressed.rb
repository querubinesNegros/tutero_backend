class ChangeNameColumnAddressed < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :addreessedTo, :addressedTo
  end
end
