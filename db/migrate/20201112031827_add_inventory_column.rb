class AddInventoryColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :inventory, :integer
  end
end
