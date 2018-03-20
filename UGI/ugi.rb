require 'slack-notifier'


FILEPATH = '/home/rasp-yyh/smart-home/UGI/ugi.txt'

new_global_ip = `curl -s ifconfig.io`.chomp

file = File.open(FILEPATH, 'r')
current_global_ip = file.gets.chomp
file.close

if (new_global_ip != current_global_ip)
  file = File.open(FILEPATH, 'w')
  file.puts(new_global_ip)
  file.close

  slack = Slack::Notifier.new(ENV['UGI_SLACK_WEBHOOK_URL'])  
  slack.ping("Global IP -> #{new_global_ip}")
end
