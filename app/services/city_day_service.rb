class CityDayService

  def initialize(city)
    @city = city
  end

  def get_forecast
    get_json[:daily][:data][0,7]
  end

  def create_or_update
    days = CityDay.where(city_id: @city.id)
    unless days.empty?
      data = get_forecast
      data.each do |datum|
        update(datum)
      end
    else
      create
    end
  end


  private

    def conn
      coordinates = LatLongService.new(@city).combine
      Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_SECRET_KEY']}/#{coordinates}?exclude=currently,minutesly,hourly,alerts,flags&time=#{Time.now.to_f.round}")
    end

    def get_json
      response = conn.body
      JSON.parse(response, symbolize_names: true)
    end

    def create
      data = get_forecast
      data.each do |datum|
        @city.city_days.create(day_id: Day.find_by(
          date: Time.at(datum[:time]).to_date).id,
          high: datum[:temperatureMax],
          low: datum[:temperatureMin],
          icon: datum[:icon],
          precip_probability: datum[:precipProbability],
          summary: datum[:summary])
      end
    end

    def update(datum)
      city_day = @city.city_days.where(day_id: Day.find_by(date: datum[:time].to_date).id)
      city_day.update(high: datum[:temperatureMax],
                      low: datum[:temperatureMin],
                      icon: datum[:icon],
                      precip_probability: datum[:precipProbability],
                      summary: datum[:summary])
    end
end
