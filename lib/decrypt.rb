require_relative './enigma'
require_relative './shift'
require 'date'

enigma = Enigma.new
shift = Shift.new
handle = File.open(ARGV[0], "r")
message_text = handle.read
handle.close

decrypted_text = enigma.decrypt(message_text.chomp, ARGV[2], ARGV[3])
writer = File.open(ARGV[1], "w")
writer.write(decrypted_text[:decryption])
writer.close

puts "Created #{ARGV[1]} with the key #{decrypted_text[:key]} and date #{decrypted_text[:date]}"
