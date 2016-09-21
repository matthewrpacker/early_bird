class OrdersController < ApplicationController
  def index
    @orders = Order.all.order(:tee_off_at)
  end

  def create
    @course = Course.find(params[:course_id])
    @tee_time = TeeTime.find_by_course_tee_time(params[:course_id], params[:id])
    TeeTime.update_quantity(params[:course_id], params[:id], params[:quantity])
    @remaining_tee_time = TeeTime.find_by_course_tee_time(params[:course_id], params[:id])

    @user_tee_time_quantity = @tee_time.quantity-@remaining_tee_time.quantity

    @order = Order.create(
      user_id: current_user.id,
      course_name: @course.name,
      course_id: @course.id,
      tee_off_at: @tee_time.tee_off_at,
      quantity: @user_tee_time_quantity,
      unit_price: @tee_time.unit_price
    )

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(:body => "Thanks for booking with EarlyBird! Your code is #{@tee_time.id}. Present this code to the starter and you are ready to play.  Enjoy your round!",
        :to => ENV['MY_NUMBER'],
        :from => ENV['MY_TWILIO_NUMBER'])

    @message = message
    redirect_to orders_path
  end
end
