# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :output, "/log/whenever.log"

set :chronic_options, hours24: true

every :sunday, at: '3:00 am' do
  rake 'update:days'
  rake 'update:steadies'
  rake 'destroy:days'
end

every 1.day, at: '3:00 am' do
  rake 'update:city_days'
end

every 15.minutes do
  rake 'update:currents'
  rake 'create:new_data'
end
