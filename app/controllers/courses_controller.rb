class CoursesController < ApplicationController
  def index
    # Use each method in view
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    # @tee_times = TeeTime.find_by(course_id: params[:id])
  end
end

# Add ID attribute to each model using service
# Write test and build out courses index view
# Write test and build out course show view
