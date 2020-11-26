class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :destroy]

  def create
    
    carted_products = current_user.carted_products.where(status: "carted")

    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.quantity * carted_product.product.price
    end

    tax_rate = 0.09

    tax = subtotal * tax_rate

    total = tax = subtotal

    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total,
    )
    if @order.save
      render 'show.json.jb'
    else
      render json: { errors: 'Something isnt right.' }, status: :bad_request
    end
    carted_products.each do |carted_product|
      carted_product.update(status: "purchased", order_id: @order.id)
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
