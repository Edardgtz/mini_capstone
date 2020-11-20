class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def sub_total
    @subtotal = product.price * quantity
  end

  def tax
    tax_rate = 0.09
    @tax = @subtotal * tax_rate
  end

  def total
    @total = @subtotal + @tax
  end
end
