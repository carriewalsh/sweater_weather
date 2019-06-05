require "csv"

namespace :import do
  desc "rake import cities"
  task cities: :environment do
    CSV.foreach("./lib/seeds/fifty_cities.csv", headers: true) do |row|
      data = "#{row["name"]}, #{row["state"]}, #{row["country"]}"
      CityCreatorService.new(data).find_or_create
    end
  end
end
