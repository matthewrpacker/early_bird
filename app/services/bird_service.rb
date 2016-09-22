class BirdService
  def initialize
    @conn = Faraday.new(:url => 'https://early-bird-courses.herokuapp.com/api/v1') do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end
  end

  def courses
    response = @conn.get "courses.json"
    JSON.parse(response.body)
  end

  def course_by_id(id)
    response = @conn.get "courses/#{id}.json"
    JSON.parse(response.body)
  end

  def tee_times_by_course_id(id)
    response = @conn.get "courses/#{id}/tee_times.json"
    JSON.parse(response.body)
  end

  def tee_time_by_course_id_and_tee_time_id(course_id, id)
    response = @conn.get "courses/#{course_id}/tee_times/#{id}.json"
    JSON.parse(response.body)
  end

  def update_tee_time_quantity(course_id, id, quantity)
    @conn.patch "courses/#{course_id}/tee_times/#{id}.json?quantity=#{quantity}"
  end
end
