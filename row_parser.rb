#!/local/bin/ruby
require 'digest/sha1'

diff_ln = ARGV[2].split('|')
boring_user = Digest::SHA1.hexdigest "16047"

for dli in 0..diff_ln.length - 1
	if((!diff_ln[dli].split(' ')[0].nil?) && ("<>".include? diff_ln[dli].split(' ')[0]) && (!diff_ln[dli].split(' ')[1].nil?) && (!diff_ln[dli].split(' ')[1].include? boring_user))
		nice_line = "#{diff_ln[dli].split(' ')[0]} #{Digest::SHA1.hexdigest diff_ln[dli].split(' ')[1]}"
		#timestamp = diff_ln[dli].split(',')[0]
		#hostname = diff_ln[dli].split(',')[1]
		#diff_ln[dli].split(',')[2].split('|').each do |ps_ln|
		for pdi in 2..diff_ln[dli].split(' ').length
			nice_line = "#{nice_line} #{diff_ln[dli].split(' ')[pdi]}"
		end
		#puts "#{timestamp} , #{hostname} , #{nice_ps_ln}"
		puts "#{ARGV[0]} , #{ARGV[1]} , #{nice_line}"
	end
end
