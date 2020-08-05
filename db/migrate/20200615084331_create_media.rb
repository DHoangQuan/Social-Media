class CreateMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :media do |t|
      t.string :link_medium
      t.string :description
      t.integer :post_id

      t.timestamps
    end
  end
end
