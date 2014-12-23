# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
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

## Information
## https://www.airpair.com/ruby-on-rails/posts/adding-stripe-to-rails-with-webhooks
set :environment, "development"
set :output, "./ticket_sales.log"

every 1.minute do
  runner 'TicketCashier.new.capture_all_pending_tickets'
end