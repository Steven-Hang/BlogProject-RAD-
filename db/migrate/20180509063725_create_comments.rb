class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :commentTime
      t.integer :post_id
	    t.string :belongs

      t.timestamps
    end
  end
end
