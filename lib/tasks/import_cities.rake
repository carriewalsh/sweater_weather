require "csv"

namespace :import do
  desc "rake import cities"
  task cities: :environment do
    CSV.foreach("./lib/seeds/fifty_cities.csv", headers: true) do |row|
      CityCreatorService.new(row).find_or_create_city
    end
  end
end
