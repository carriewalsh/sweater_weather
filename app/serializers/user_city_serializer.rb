class UserCitySerializer

  def initialize(user_city)
    
  end
  attributes :id

  belongs_to :city
  belongs_to :city_current
end
