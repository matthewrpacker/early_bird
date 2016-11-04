require 'rails_helper'

describe BirdService do
  context "#courses" do
    it "returns parsed course info"do
      VCR.use_cassette("bird_service_info") do
        earlybird = BirdService.new
        courses = earlybird.courses
        overland = courses.first

        expect(courses.class).to eq(Array)
        expect(courses.count).to eq(12)
        expect(overland['name']).to eq('Overland Park')
        expect(overland['street']).to eq('1801 S. Huron St.')
        expect(overland['city']).to eq('Denver')
        expect(overland['state']).to eq('CO')
        expect(overland['image_path']).to eq('http://www.cityofdenvergolf.com/images/galleries/overland_park/Overland%20Hole%201a%20NEW.jpg')
        expect(overland['phone']).to eq('720-865-0430')
      end
    end
  end

  context "#course_by_id" do
    it "returns parsed info for specific course" do
      VCR.use_cassette("bird_service_info") do
        earlybird = BirdService.new
        city_park = earlybird.course_by_id(2)

        expect(city_park.class).to eq(Hash)
        expect(city_park['name']).to eq('City Park')
        expect(city_park['street']).to eq('2500 York Street')
        expect(city_park['city']).to eq('Denver')
        expect(city_park['state']).to eq('CO')
        expect(city_park['image_path']).to eq('http://www.cityofdenvergolf.com/images/galleries/city_park/City%20Park%206th%20Green.jpg')
        expect(city_park['phone']).to eq('720-865-3410')
      end
    end
  end

  context "#tee_times_by_course_id" do
    it "returns parsed tee time info for specific course" do
      VCR.use_cassette("bird_service_info") do
        earlybird = BirdService.new
        murphy_creek_tee_times = earlybird.tee_times_by_course_id(9)
        first_tee_time = murphy_creek_tee_times.last

        expect(murphy_creek_tee_times.class).to eq(Array)
        expect(murphy_creek_tee_times.count).to eq(1830)
        expect(first_tee_time.class).to eq(Hash)
        expect(first_tee_time['tee_off_at']).to eq('2016-11-01T07:00:00.000Z')
        expect(first_tee_time['unit_price']).to eq('27.0')
        expect(first_tee_time['course_id']).to eq(9)
        expect(first_tee_time['quantity']).to eq(2)
      end
    end
  end

  context "#tee_time_by_course_id_and_tee_time_id" do
    it "returns parsed tee time info for specific course and specific tee time" do
      VCR.use_cassette("bird_service_info") do
        earlybird = BirdService.new
        first_tee_time = earlybird.tee_time_by_course_id_and_tee_time_id(1, 99)

        expect(first_tee_time.class).to eq(Hash)
        expect(first_tee_time['tee_off_at']).to eq('2016-11-02T13:10:00.000Z')
        expect(first_tee_time['unit_price']).to eq('27.0')
        expect(first_tee_time['course_id']).to eq(1)
        expect(first_tee_time['id']).to eq(99)
        expect(first_tee_time['quantity']).to eq(4)
      end
    end
  end
end
