class RemoveUrlColumnFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :url, :integer
  end
end
