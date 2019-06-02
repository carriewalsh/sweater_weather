class SteadyService

  def initialize(city)
    @city = city
  end

  def get_astros
    get_json[:astronomy][:astronomy][0,7]
  end

  def create_or_update
    days = CitySteady.where(city_id: @city.id)
    unless days.empty?
      data = get_astros
      data.each do |datum|
        update(datum)
      end
    else
      create
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

    def create
      data = get_astros
      data.each do |datum|
        @city.city_steadies.create(day_id: Day.find_by(
          date: datum[:utcTime].to_date).id,
          sunrise: datum[:sunrise],
          sunset: datum[:sunset],
          moon_phase: datum[:moonPhase],
          phase_description: datum[:moonPhaseDesc],
          phase_icon: datum[:iconName])
      end
    end

    def update(datum)
      steady = @city.city_steadies.where(day_id: Day.find_by(date: datum[:utcTime].to_date).id)
      steady.update(sunrise: datum[:sunrise],
                    sunset: datum[:sunset],
                    moon_phase: datum[:moonPhase],
                    phase_description: datum[:moonPhaseDesc],
                    phase_icon: datum[:iconName])
    end
end
