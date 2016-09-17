class CourseInfo
  attr_reader :name, :street, :city, :state, :image, :phone

  def initialize(course_attributes)
    @name = course_attributes['name']
    @street = course_attributes['street']
    @city = course_attributes['city']
    @state = course_attributes['state']
    @image = course_attributes['image_path']
    @phone = course_attributes['phone']
  end

  def self.service
    BirdService.new
  end

  def self.courses
    service.courses.map do |course|
      new(course)
    end
  end
end
