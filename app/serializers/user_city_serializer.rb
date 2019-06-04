class UserCitySerializer

  attr_accessor :id, :city_id, :user_id, :city_current_id

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
