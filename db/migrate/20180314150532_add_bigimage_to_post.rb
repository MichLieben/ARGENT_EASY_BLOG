class AddBigimageToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :image, :string
    add_column :posts, :bigimage, :string
  end
end
