class SteadyService

  def initialize(city)
    @city = city
  end

  def get_astros
    get_json[:astronomy][:astronomy][0,7]
  end

  def create_or_update
    if CitySteady.find_by(city_id: @city.id)
    else
    end
  end

  private

    def conn
      place = @city.name + ' ' + @city.state
      Faraday.get("https://weather.cit.api.here.com/weather/1.0/report.json?app_id=DemoAppId01082013GAL&app_code=AJKnXv84fjrb0KIHawS0Tg&product=forecast_astronomy&name=#{place}")
    end

    def get_json
      response = conn.body
      JSON.parse(response, symbolize_names: true)
    end
end
