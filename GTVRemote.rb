require 'rubygems'
require 'bundler/setup'
require 'google_anymote'

module GTVRemote

  extend self

  def pair
    @gtv_cert = File.read('certs/cert.pem')
    @host = "ssegoogletv.rit.edu"
    @gtv = GoogleAnymote::TV.new(@gtv_cert, @host)
  end

  def unpair
    @gtv = nil
  end

  def fling(uri)
    @gtv.fling_uri(uri)
  end

  def send_keycode(k)
    @gtv.send_keycode(Code.values[k]) unless Code.values[k].nil?
  end

  def power_off
    send_keycode(:KEYCODE_CALL)
    send_keycode(:KEYCODE_POWER)
  end

  def power_on
    send_keycode(:KEYCODE_CALL)
  end
end
