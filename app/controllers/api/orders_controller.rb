class Api::OrdersController < ApplicationController
  def create
    p "current_usre"
    p current_user
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
    )
    if @order.save
      render 'show.json.jb'
    else
      render json: { errors: 'Something isnt right.' }, status: :bad_request
    end
  end

  def index
    @orders = Order.find_by(user_id: current_user.id)
    render 'index.json.jb'
  end

  def show
    @order = Order.find_by(id: params[:id])

    render 'show.json.jb'
  end
end
