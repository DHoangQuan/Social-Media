class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :comment_content
      t.integer :post_id
      t.integer :medium_id
      t.integer :user_id
      t.integer :parent_comment_id

      t.timestamps
    end
  end
end
