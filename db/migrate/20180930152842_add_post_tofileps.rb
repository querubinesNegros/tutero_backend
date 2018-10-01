class AddPostTofileps < ActiveRecord::Migration[5.2]
  def change
    add_reference :fileps, :post, index: true
  end
end
