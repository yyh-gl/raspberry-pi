# coding: utf-8

def ring_alarm
  `say #{"起きろー。" * 10}`   ## mac用
  # `/usr/bin/jsay.sh #{"起きろー。" * 10}`   ## ラズパイ用
end

wake_up_time = ARGV[0].to_i
loop do
  break if Time.now.strftime("%H%M").to_i >= wake_up_time
  sleep 10
end
ring_alarm
