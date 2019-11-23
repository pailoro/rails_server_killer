port = ARGV.first || 3000
system("sudo echo kill-server-on #{port}")

pid = `sudo lsof -iTCP -sTCP:LISTEN -n -P | grep #{port} | awk '{ print $2 }' | head -n 1`.strip
puts "PID: #{pid}"
`kill -9 #{pid}` unless pid.empty?