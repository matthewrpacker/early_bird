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

  def tee_times_by_course_id_with_date(id, date: date)
    response = @conn.get "courses/#{id}/tee_times.json", {tee_off_at: date}
    JSON.parse(response.body)
  end

  def tee_times_by_date(date: date)
    response = @conn.get "courses/#{id}/tee_times.json", {tee_off_at: date}
    JSON.parse(response.body)
  end
end
