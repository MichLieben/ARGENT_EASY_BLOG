class CreateSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribers do |t|
      t.string :firstname
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
