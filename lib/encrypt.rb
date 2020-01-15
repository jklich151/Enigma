require_relative './enigma'
require_relative './shift'
require 'date'


enigma = Enigma.new
shift = Shift.new
handle = File.open(ARGV[0], "r")
message_text = handle.read
handle.close

encrypted_text = enigma.encrypt(message_text.chomp)
writer = File.open(ARGV[1], "w")
writer.write(encrypted_text[:encryption])
writer.close

puts "Created #{ARGV[1]} with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"
