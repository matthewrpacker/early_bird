class TeeTime
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

  def self.find_by_course(id)
    service.tee_times_by_course_id(id).map do |tee_time|
      new(tee_time)
    end.reverse
  end

  # def self.find_by(date: date)
  #   service.tee_times_by_date(date).map do |tee_time|
  #     new(tee_time)
  #   end
  # end
  #
  # def self.find_by(coures_id: course_id, date: date)
  #   service.tee_times_by_course_id_with_date(course_id, date).map do |tee_time|
  #     new(tee_time)
  #   end
  # end
end
