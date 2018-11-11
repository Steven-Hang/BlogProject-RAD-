class AddIndexToPosts < ActiveRecord::Migration[5.2]
  def change
	add_index :comments, :post_id
  end
end
