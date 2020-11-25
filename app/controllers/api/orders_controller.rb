class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]

  def create
    @order = Order.find_by(id: params[:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price
    tax_rate = 0.09
    calculated_tax = calculated_subtotal * tax_rate
    calculated_total = calculated_subtotal + calculated_tax
   
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    if @order.save
      render 'show.json.jb'
    else
      render json: { errors: 'Something isnt right.' }, status: :bad_request
    end
  end

  def index
    @orders = current_user.orders
    render 'index.json.jb'
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    render 'show.json.jb'
  end
end
