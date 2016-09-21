class TeeTime
  attr_reader :id, :unit_price, :course_id, :booked, :quantity, :time, :date, :total_price, :tee_off_at

  def initialize(tee_time_attributes)
    @id = tee_time_attributes['id']
    @tee_off_at = tee_time_attributes['tee_off_at']
    @unit_price = tee_time_attributes['unit_price']
    @course_id = tee_time_attributes['course_id']
    @booked = tee_time_attributes['booked']
    @quantity = tee_time_attributes['quantity']
  end

  def self.service
    BirdService.new
  end

  def date
    tee_off_at = @tee_off_at
    date = DateTime.parse(tee_off_at)
    formatted_date = date.strftime('%a %b %d')
  end

  def time
    time = DateTime.parse(@tee_off_at)
    formatted_time = time.strftime('%l:%M %p')
  end

  def unit_price
    convert_to_dollars(@unit_price)
  end

  def convert_to_dollars(amount)
    '%.2f' % (amount.to_i)
  end

  def total_price(tee_time)
    convert_to_dollars(tee_time.unit_price.to_i*tee_time.quantity.to_i)
  end

  def self.find_by_course(id)
    service.tee_times_by_course_id(id).map do |tee_time|
      new(tee_time)
    end.reverse
  end

  def self.find_by_course_tee_time(course_id, id)
    new(service.tee_time_by_course_id_and_tee_time_id(course_id, id))
  end

  def self.update_quantity(course_id, id, quantity)
    service.update_tee_time_quantity(course_id, id, quantity)
  end

  # def self.find_by_course_and_date(id, date: date)
  #   service.tee_times_by_course_id_with_date(id, date).map do |tee_time|
  #     new(tee_time)
  #   end.reverse
  # end

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
