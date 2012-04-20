#!/local/bin/ruby

timestamp = ARGV[0].split('%')[0]
hostname = ARGV[0].split('%')[1]

ARGV[0].split('%')[2].split('|').each do |x|

	puts "#{timestamp} % #{hostname} % #{x}"

end
