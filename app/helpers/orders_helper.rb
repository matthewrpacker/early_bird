module OrdersHelper
  def send_text_confirmation
    create_twilio_client
    create_twilio_message
  end

  def create_twilio_client
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def create_twilio_message
    @client.account.messages.create(
      body: thank_you_message,
      to: my_number,
      from: my_twilio_number
    )
  end

  def thank_you_message
    "Thanks for booking with EarlyBird! Your code is #{@tee_time.id}."\
    " Present this code to the starter and you are ready to play."\
    " Enjoy your round!"
  end

  def my_number
    ENV['MY_NUMBER']
  end

  def my_twilio_number
    ENV['MY_TWILIO_NUMBER']
  end

  def find_booking_details
    @course = Course.find(params[:course_id])
    @tee_time = TeeTime.find_by_course_tee_time(params[:course_id], params[:id])
    TeeTime.update_quantity(params[:course_id], params[:id], params[:quantity])
    @remaining_tee_time = TeeTime.find_by_course_tee_time(params[:course_id], params[:id])
    booking_quantity
  end

  def booking_quantity
    @user_tee_time_quantity = @tee_time.quantity-@remaining_tee_time.quantity
  end
end
