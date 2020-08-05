class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.integer :host_id
      t.integer :relation_id
      # t.integer :followee_id
      # t.integer :follower_id
      t.string :status_friend
      t.string :status_action

      t.timestamps
    end
  end
end
