namespace :create do
  desc "rake search for new cities and create data"
  task new_data: :environment do
    cities = City.where(city_steadies: nil)
    cities.each do |city|
      CityDayService.new(city).create_or_update
      SteadyService.new(city).create_or_update
    end
  end

  desc "rake create days (initial)"
  task days: :environment do
    today = Date.today
    count = 0
    while count < 14
      day = (today + count.days)
      Day.create(name: day.strftime("%A"), abbreviation: day.strftime("%a"), date: day)
      count += 1
    end
  end

  desc "rake create day (continued)"
  task day: :environment do
    day = Date.today + 14.days
    Day.create(name: day.strftime("%A"), abbreviation: day.strftime("%a"), date: day)
  end

  desc "rake create current"
  task currents: :environment do
    cities = City.where(city_current: nil)
    cities.each do |city|
      CityCurrent.new(city).create_or_update
    end
  end
end
