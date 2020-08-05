class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :avatar
      t.date :date_of_birth
      t.string :phone_number
      t.string :description
      t.string :status_relationship
      t.string :home_town

      t.timestamps
    end
  end
end
