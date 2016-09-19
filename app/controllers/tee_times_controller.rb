class TeeTimesController < ApplicationController
  def index
    @tee_times = TeeTime.find_by_course(params[:id])
    @course = Course.find(params[:id])
  end

  def show
    @tee_time = TeeTime.find_by_course_tee_time(params[:course_id], params[:id])
    @course = Course.find(params[:course_id])
  end
end


# Index Action acctepts date params:
# course_id = params[:course_id]
# date = params[:date]
# if course_id && date
#   @tee_times = TeeTime.find_by(course_id: params[:course_id])
# elsif course_id
#   @tee_times = TeeTime.find_by(course_id: params[:course_id])
# elsif date
#   @tee_times = TeeTime.find_by(tee_off_at: params[:course_id])
# else
# end

# # TWillio:
# account_sid = ENV['TWILIO_ACCOUNT_SID'] # Your Account SID from www.twilio.com/console
# auth_token = ENV['TWILIO_AUTH_TOKEN']   # Your Auth Token from www.twilio.com/console
#
# @client = Twilio::REST::Client.new account_sid, auth_token
# message = @client.account.messages.create(:body => "Hello from EarlyBird",
#     :to => ENV['MY_NUMBER'],    # Replace with your phone number
#     :from => ENV['MY_TWILIO_NUMBER'])  # Replace with your Twilio number
#
# @message = message
