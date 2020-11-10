class Api::ProductsController < ApplicationController

  def index
    @products = Product.all
    p @products
    render "index.json.jb"
  end

  def show
    item_id = params[:id]
    @product = Product.find_by(id: item_id)
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
      name: params[:input_name],
      description: params[:input_description],
      price: params[:input_price],
      image_url: params[:input_image_url]
    )
    @product.save
    render 'show.json.jb'
  end

end
