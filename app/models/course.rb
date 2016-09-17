class Course
  attr_reader :id, :name, :street, :city, :state, :image, :phone, :location

  def initialize(course_attributes)
    @id = course_attributes['id']
    @name = course_attributes['name']
    @street = course_attributes['street']
    @city = course_attributes['city']
    @state = course_attributes['state']
    @image = course_attributes['image_path']
    @phone = course_attributes['phone']
    @location = "#{course_attributes['city']}, #{course_attributes['state']}"
  end

  def self.service
    BirdService.new
  end

  def self.all
    service.courses.map do |course|
      new(course)
    end
  end

  def self.find(id)
    new(service.course_by_id(id))
  end
end
