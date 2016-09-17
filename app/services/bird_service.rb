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

  def course_tee_times(id)
    response = @conn.get "courses/#{id}/tee_times.json"
    JSON.parse(response.body)
  end

  def course_tee_times_by_date(id, date)
    response = @conn.get "courses/#{id}/tee_times.json", {tee_off_at: date}
    JSON.parse(response.body)
  end
end
