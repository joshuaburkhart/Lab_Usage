#!/local/bin/ruby
require 'digest/sha1'

diff_ln = ARGV[2].split('|')
boring_user = "16047"

for dli in 0..diff_ln.length - 1
	if((!diff_ln[dli].split(' ')[0].nil?) && ("<>".include? diff_ln[dli].split(' ')[0]) && (!diff_ln[dli].split(' ')[1].nil?) && (!diff_ln[dli].split(' ')[1].include? boring_user))
		action = diff_ln[dli].split(' ')[0] == "<" ? "+ STARTED" : "X STOPPED"
		nice_line = "#{action} #{Digest::SHA1.hexdigest diff_ln[dli].split(' ')[1]}"
		for pdi in 2..diff_ln[dli].split(' ').length
			nice_line = "#{nice_line} #{diff_ln[dli].split(' ')[pdi]}"
		end
		puts "#{ARGV[0]} , #{ARGV[1]} , #{nice_line}"
	end
end
