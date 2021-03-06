class Api::ProductsController < ApplicationController
  

  def index
    p "****************"
    p current_user
    p "****************"
    search_term = params[:search]
    if search_term
      @products = Product.where("name ILIKE ?","%#{search_term}%")
    else
      @products = Product.all
    end

    category = params[:category]
    if category
      @products = Category.find_by(name: params[:category]).products
    else
      @products = Product.all
    end

    
    if params[:sort] && params[:sort_order]
      @products = @products.order(params[:sort] => params[:sort_order])
    else
      @products = @products.order(id: :asc)
    end
    render "index.json.jb"

    discount = params[:discount]
    if discount == "true" 
      @products = Product.where("price < 20")
    end

  end

  def show
    item_id = params[:id]
    @product = Product.find_by(id: item_id)
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      inventory: params[:inventory],
      supplier_id: params[:supplier_id],
    )
    
    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    # find the product
    item_id = params[:id]
    @product = Product.find_by(id: item_id)
    #Modify it
    @product.name = params[:name] || @product.name 
    @product.description = params[:description] || @product.description
    @product.price = params[:price] || @product.price
    @product.inventory = params[:inventory] || @product.inventory
    @product.supplier_id = params[:supplier_id] || @product.supplier_id
    @product.save
    render 'show.json.jb'
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "Product destroyed successfully!"}
  end

end
