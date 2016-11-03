class OrdersController < ApplicationController
  include OrdersHelper

  def index
    @orders = current_user.orders.all.order(:tee_off_at)
  end

  def create
    find_booking_details

    @order = current_user.orders.create(
      user_id: current_user.id,
      course_name: @course.name,
      course_id: @course.id,
      tee_off_at: @tee_time.tee_off_at,
      quantity: @user_tee_time_quantity,
      unit_price: @tee_time.unit_price
    )

    send_text_confirmation
    redirect_to orders_path
  end
end
