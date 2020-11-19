class Api::ImagesController < ApplicationController
  def index
    search_term = params[:search]
    if search_term
      @images = Image.where("name ILIKE ?","%#{search_term}%")
    else
      @images = Image.all
    end

    
    if params[:sort] && params[:sort_order]
      @images = @images.order(params[:sort] => params[:sort_order])
    else
      @images = @images.order(id: :asc)
    end
    render "index.json.jb"
    

  end

  def show
    instance_id = params[:id]
    @image = Image.find_by(id: instance_id)
    render 'show.json.jb'
  end

  def create
    @image = Image.new(
      url: params[:url],
      product_id: params[:product_id],
      
    ) 
    if @image.save
      render 'show.json.jb'
    else
      render json: {errors: @image.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    # find the Supplier
    instance_id = params[:id]
    @image = Image.find_by(id: instance_id)
    #Modify it
    @image.url = params[:url] || @image.url 
    @image.product_id = params[:product_id] || @image.product_id
    @image.save
    render 'show.json.jb'
  end

  def destroy
    @image = Image.find_by(id: params[:id])
    @image.destroy
    render json: {message: "Image destroyed successfully!"}
  end
end
