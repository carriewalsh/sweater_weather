class CityDayService
  include GetService
  attr_reader :url

  def initialize(city)
    @city = city
    @url = "https://api.darksky.net/forecast/#{ENV['DARK_SKY_SECRET_KEY']}/#{@city.coordinates}?exclude=currently,minutesly,hourly,alerts,flags&time=#{Time.now.to_f.round}"
  end

  def get_forecast
    get_json(nil,nil)[:daily][:data][1,7]
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
      city_day = @city.city_days.where(day_id: Day.find_by(date: Time.at(datum[:time]).to_date).id)
      city_day.update(high: datum[:temperatureMax],
                      low: datum[:temperatureMin],
                      icon: datum[:icon],
                      precip_probability: datum[:precipProbability],
                      summary: datum[:summary])
    end
end
