class CityCreatorService
  include GetService
  attr_reader :url

  def initialize(input)
    if input[0,4].to_i == 0
      @latlong = LatLongService.new(input).combine
    else
      @latlong = input
    end

    @url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=#{@latlong}&key=#{ENV['GOOGLE_SECRET_KEY']}"
  end

  def find_or_create
    city = get_city
    state = get_state
    country = get_country
    if City.where(name: city, state: state).empty? && country
      new = City.create!( name: city,
                    state: state,
                    country: country,
                    latitude: @latlong.split(",")[0],
                    longitude: @latlong.split(",")[1])
      new.add_photo
      new
    elsif City.where(name: city, state: state, country: country).first
      City.where(name: city, state: state, country: country).first
    end
  end

  private

    def get_city
      city = nil
      data.map do |datum|
        if datum[:types].include?("locality")
          city = datum[:long_name]
          break
        elsif datum[:types].include?("administrative_area_level_1")
          city = datum[:long_name]
        end
      end
      if city.nil?
        city = data.first[:long_name]
      end
      city
    end

    def get_state
      state = nil
      data.map do |datum|
        if datum[:types].include?("administrative_area_level_1")
          state = datum[:long_name]
        end
      end
      state ? state : ""
    end

    def get_country
      country = nil
      data.map do |datum|
        if datum[:types].include?("country")
          country = datum[:long_name]
        end
      end
      country
    end

    def data
      get_json(nil,nil)[:results].first[:address_components]
    end
end
