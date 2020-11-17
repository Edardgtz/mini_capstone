class Supplier < ApplicationRecord
  def supplier
    Product.where(supplier_id: id)
  end
end
