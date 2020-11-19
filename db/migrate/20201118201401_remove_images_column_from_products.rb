class RemoveImagesColumnFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :images, :string
  end
end
