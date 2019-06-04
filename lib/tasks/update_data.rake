namespace :update do
  desc "rake update steadies"
  task steadies: :environment do
    City.all.each do |city|
      SteadyService.new(city).create_or_update
    end
  end

  desc "rake update city days"
  task city_days: :environment do
    City.all.each do |city|
      CityDayService.new(city).create_or_update
    end
  end

  desc "rake update currents"
  task currents: :environment do
    City.all.each do |city|
      CurrentService.new(city).create_or_update
    end
  end
end
