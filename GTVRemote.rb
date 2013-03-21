require 'rubygems'
require 'bundler/setup'
require 'google_anymote'

module GTVRemote
	@@cert = File.read(File.join(File.dirname(__FILE__),"certs/cert.pem"))
	@@host = "ssegoogletv.rit.edu"
	@@gtv = nil
	

	def self.open()
		@@gtv = GoogleAnymote::TV.new(@@cert, @@host)
	end

	def self.close()
		@@gtv = nil
	end

	def self.power_on()
		@@gtv.send_keycode(Code.values[:KEYCODE_CALL])
	end

	def self.power_off()
		@@gtv.send_keycode(Code.values[:KEYCODE_CALL])
		@@gtv.send_keycode(Code.values[:KEYCODE_POWER])
	end

	def self.open_uri(uri)
		@@gtv.fling_uri("about:blank")
		@@gtv.fling_uri(uri)
	end
end
