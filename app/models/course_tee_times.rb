class CourseTeeTimes
  attr_reader :tee_off_at, :unit_price, :course_id, :booked, :quantity

  def initialize(tee_time_attributes)
    @tee_off_at = tee_time_attributes['tee_off_at']
    @unit_price = tee_time_attributes['unit_price']
    @course_id = tee_time_attributes['course_id']
    @booked = tee_time_attributes['booked']
    @quantity = tee_time_attributes['quantity']
  end

  def self.service
    BirdService.new
  end

  def self.course_tee_times(id)
    service.course_tee_times(id).map do |tee_time|
      new(tee_time)
    end
  end
end
