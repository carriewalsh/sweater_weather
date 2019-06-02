namespace :destroy do
  desc "rake destroy old days"
  task days: :environment do
    Day.where("created_at < ?", 30.days).destroy
  end
end
