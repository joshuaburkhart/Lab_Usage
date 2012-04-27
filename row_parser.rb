#!/local/bin/ruby
require 'digest/sha1'

timestamp = ARGV[0].split(',')[0]
hostname = ARGV[0].split(',')[1]

ARGV[0].split(',')[2].split('|').each do |ps_ln|

	nice_ps_ln = Digest::SHA1.hexdigest ps_ln.split(' ')[0]

	for i in 1..ps_ln.split(' ').length 
		nice_ps_ln = "#{nice_ps_ln} #{ps_ln.split(' ')[i]}"
	end

	puts "#{timestamp} , #{hostname} , #{nice_ps_ln}"

end
