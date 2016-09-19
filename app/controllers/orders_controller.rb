class OrdersController < ApplicationController
  def index
    @orders = Order.all
    # - And I should see my most recent order
    # order by id descending
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.create()

    # - Post to /api/v1/courses/1/tee_times/1 should update tee_time quantity

    # - If tee time quantity is 0, status should change from booked: false to booked: true

    redirect_to orders_path
  end
end
