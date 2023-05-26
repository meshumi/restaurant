class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    orders = Order.all
    render json: orders
  end

  def show
    render json: { order: @order, order_items: @order.order_items }
  end

  def create
    order = Order.new(order_params)
    if order.save
      create_order_items(order)
      render json: order, status: :created
    else
      render json: order.errors, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    head :no_content
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:restaurant_id, order_items_attributes: [:menu_item_id, :quantity])
  end

  def create_order_items(order)
    order_items_params = order_params[:order_items_attributes]
    return unless order_items_params

    order_items_params.each do |item_params|
      order.order_items.build(item_params)
    end
  end
end
