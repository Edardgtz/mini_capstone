class RemoveImage1Column < ActiveRecord::Migration[6.0]
  def change
    remove_column :images, :image_1, :string
  end
end
