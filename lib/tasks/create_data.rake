namespace :create do
  desc "rake search for new cities and create data"
  task new_data: :environment do
    cities = City.where(city_steadies: nil)
    cities.each do |city|
      CityDayService.new(city).create_or_update
      SteadyService.new(city).create_or_update
    end
  end
end
