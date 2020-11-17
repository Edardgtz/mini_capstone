class Api::SuppliersController < ApplicationController
  def index
    search_term = params[:search]
    if search_term
      @suppliers = Supplier.where("name ILIKE ?","%#{search_term}%")
    else
      @suppliers = Supplier.all
    end

    
    if params[:sort] && params[:sort_order]
      @suppliers = @suppliers.order(params[:sort] => params[:sort_order])
    else
      @suppliers = @suppliers.order(id: :asc)
    end
    render "index.json.jb"
    

  end

  def show
    instance_id = params[:id]
    @supplier = Supplier.find_by(id: instance_id)
    render 'show.json.jb'
  end

  def create
    @supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number],
      
    ) 
    if @supplier.save
      render 'show.json.jb'
    else
      render json: {errors: @supplier.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    # find the Supplier
    instance_id = params[:id]
    @supplier = Supplier.find_by(id: instance_id)
    #Modify it
    @supplier.name = params[:name] || @supplier.name 
    @supplier.email = params[:email] || @supplier.email
    @supplier.phone_number = params[:phone_number] || @supplier.phone_number
    
    @supplier.save
    render 'show.json.jb'
  end

  def destroy
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.destroy
    render json: {message: "Supplier destroyed successfully!"}
  end

end
