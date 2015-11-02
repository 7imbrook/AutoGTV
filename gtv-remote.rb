require_relative "GTVRemote"

GTVRemote::pair
if ARGV[0] == "on"
  GTVRemote::power_on
elsif ARGV[0] == "off"
  GTVRemote::power_off
elsif ARGV[0] == "url"
  GTVRemote::fling(ARGV[1])
end
GTVRemote::unpair

