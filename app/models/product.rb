class Product < ApplicationRecord
  validates :name, :price, :description, presence: true
  validates :description, length: {in: 10..500}

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def tax
    @tax = price * 0.09
    
  end

  def is_discounted?
    price.to_i < 10
  end  

  def total
    @price = price.to_i
    @total = @price.round(2) + tax
    @total.round(2)
  end
end
