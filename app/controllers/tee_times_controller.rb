class TeeTimesController < ApplicationController
  def index
    @tee_times = TeeTime.find_by_course(params[:id])
    @course = Course.find(params[:id])
  end

  def show
    @tee_time = TeeTime.find_by_course_tee_time(params[:course_id], params[:id])
    @course = Course.find(params[:course_id])
    @players = Player.all
  end
end
