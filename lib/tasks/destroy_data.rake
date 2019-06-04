namespace :destroy do
  desc "rake destroy old data"
  task data: :environment do
    Day.where("created_at < ?", 21.days).destroy
    CityDay.where("created_at < ?", 21.days).destroy
    CitySteady.where("created_at < ?", 21.days).destroy
  end
end
