class FlickrService
  include GetService
  attr_reader :url

  def initialize(city)
    @city = city
    @url = "https://api.flickr.com/services/rest?api_key=#{ENV["FLICKR_API_KEY"]}&method=flickr.photos.search&format=json&text=park #{city.name} #{city.state}&sort=relevance&nojsoncallback=1"
  end

  def get_photo
    get_json[:photos][:photo].first
  end
end
