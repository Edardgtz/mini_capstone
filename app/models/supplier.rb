class Supplier < ApplicationRecord
  has_many :products
  # def supplier
  #   Product.where(supplier_id: id)
  # end
end
