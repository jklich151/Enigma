handle = File.open(ARGV[0], "r")

message_text = handle.read

handle.close

encrypted_text = message_text.encrypt

writer = File.open(ARGV[1], "w")

writer.write(encrypted_text)

writer.close
