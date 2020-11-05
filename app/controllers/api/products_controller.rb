class Api::ProductsController < ApplicationController

  def list_products
    @product = Product.all
    render "product_info.json.jb"
  end

end
