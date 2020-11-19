class ChangeImage1ToUrl < ActiveRecord::Migration[6.0]
  def change
    remove_column :images, :image_1, :string
  end
  def change
    add_column :images, :url, :string
  end
end
