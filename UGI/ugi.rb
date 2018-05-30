require 'slack-notifier'
require 'dotenv'

Dotenv.load

new_global_ip = `wget -q -O - ipcheck.ieserver.net`.chomp

file = File.open(ENV['FILEPATH'], 'r')
current_global_ip = file.gets.chomp
file.close

if new_global_ip != current_global_ip
  file = File.open(ENV['FILEPATH'], 'w')
  file.puts(new_global_ip)
  file.close

  file = File.open(ENV['LOGPATH'], 'a')
  file.puts(new_global_ip)
  file.close

  slack = Slack::Notifier.new(ENV['UGI_SLACK_WEBHOOK_URL'])
  slack.ping(new_global_ip)
end
