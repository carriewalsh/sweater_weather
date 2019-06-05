class PhotoService
  include GetService
  attr_reader :url

  def initialize(city)
    @city = city
    if @city.state && @city.country == "United States"
      @url = "https://api.flickr.com/services/rest?api_key=#{ENV["FLICKR_API_KEY"]}&method=flickr.photos.search&format=json&text=park #{I18n.transliterate(city.name)}, #{I18n.transliterate(city.state)},#{I18n.transliterate(city.country)}&sort=relevance&nojsoncallback=1"
    else
      @url = "https://api.flickr.com/services/rest?api_key=#{ENV["FLICKR_API_KEY"]}&method=flickr.photos.search&format=json&text= #{I18n.transliterate(city.name)} #{I18n.transliterate(city.country)}&sort=relevance&nojsoncallback=1"
    end
  end

  def get_photo
    if get_json(nil,nil)[:photos][:photo].first
      get_json(nil,nil)[:photos][:photo].first
    end
  end
end
