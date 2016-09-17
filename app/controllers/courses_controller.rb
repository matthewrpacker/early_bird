class CoursesController < ApplicationController
  def index
    # Use each method in view
    @courses = CourseInfo.courses
  end

  def show
    # Use with each method in view
    @course = index.find(params[:id])

    @course_tee_times = CourseTeeTimes.course_tee_times(1)
  end
end

# Add ID attribute to each model using service
# Write test and build out courses index view
# Write test and build out course show view
