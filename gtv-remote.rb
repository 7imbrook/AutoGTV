#!/home/deploy/.rbenv/shims/ruby
require_relative "GTVRemote"

ARGV.each do |arg|
	arg = arg.split("=")
	arg[0] = arg[0].downcase

	GTVRemote::open()
	if arg[0] == "on"
		GTVRemote::power_on
	elsif arg[0] == "off"
		GTVRemote::power_off
	elsif arg[0] == "url"
		begining = ""
		if !arg[1].start_with?("http://")
			begining = "http://"
		end
		GTVRemote::open_uri(begining + arg[1])
	end
	GTVRemote::close()
end
