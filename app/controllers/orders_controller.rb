class OrdersController < ApplicationController
  def index
    @orders = Order.all.order(:tee_off_at)
  end

  def create
    @course = Course.find(params[:course_id])
    @tee_time = TeeTime.find_by_course_tee_time(params[:course_id], params[:id])
    TeeTime.update_quantity(params[:course_id], params[:id], params[:quantity])

    @order = Order.create(
      user_id: current_user.id,
      course_name: @course.name,
      course_id: @course.id,
      tee_off_at: @tee_time.tee_off_at,
      quantity: @tee_time.quantity,
      unit_price: @tee_time.unit_price
    )

    redirect_to orders_path
  end
end
