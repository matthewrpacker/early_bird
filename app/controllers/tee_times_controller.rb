class TeeTimesController < ApplicationController
  def index
    @tee_times = TeeTime.find_by_course(params[:id])
  end
end



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
