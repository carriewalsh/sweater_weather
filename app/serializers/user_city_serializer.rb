class UserCitySerializer

  def initialize(user, favorites)
    @user = user
    @forecasts = favorites.map { |favorite| {favorite.name => favorite.city_current} }
  end

  def jsonify
    {@user.email => {
      data: @forecasts}
      }.to_json
  end
end
