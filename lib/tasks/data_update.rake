namespace :update do
  desc "rake update steadies"
  task steadies: :environment do
    City.all.each do |city|
      SteadyService.new(city).create_or_update
    end
  end

  desc "rake update days list"
  task days: :environment do
    next_week = Date.today + 7.days
    count = 0
    while count < 7
      day = (next_week + count.days)
      Day.create(name: day.strftime("%A"), abbreviation: day.strftime("%a"), date: day)
      count += 1
    end
  end

  desc "rake update city days"
  task city_days: :environment do
    City.all.each do |city|
      CityDayService.new(city).create_or_update
    end
  end
end
