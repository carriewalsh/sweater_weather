namespace :create do
  desc "rake create days"
  task days: :environment do
    today = Date.today
    count = 0
    while count < 7
      day = (today + count.days)
      Day.create(name: day.strftime("%A"), abbreviation: day.strftime("%a"), date: day)
      count += 1
    end
  end
end
