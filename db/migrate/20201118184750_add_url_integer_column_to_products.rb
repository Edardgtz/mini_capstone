class AddUrlIntegerColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :url, :integer
  end
end
