class PhotoService
  include GetService
  attr_reader :url

  def initialize(city)
    @city = city
    if @city.state
      @url = "https://api.flickr.com/services/rest?api_key=#{ENV["FLICKR_API_KEY"]}&method=flickr.photos.search&format=json&text=park #{city.name} #{city.state}&sort=relevance&nojsoncallback=1"
    else
      @url = "https://api.flickr.com/services/rest?api_key=#{ENV["FLICKR_API_KEY"]}&method=flickr.photos.search&format=json&text=park #{city.name} #{city.country}&sort=relevance&nojsoncallback=1"
    end
  end

  def get_photo
    if get_json[:photos][:photo].first
    end
  end
end
