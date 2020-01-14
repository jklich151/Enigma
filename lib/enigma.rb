class Enigma

  def initialize
    @shift = Shift.new
    @key = @shift.key
    @date = @shift.date
  end

  def encrypt(message, key = @key, date = @date)
    @shift = Shift.new(key, date)
    {
      encryption: @shift.new_message(message),
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = DateTime.now.strftime('%d%m%y'))
    @shift = Shift.new(key, date)
    {
    decryption: @shift.change_back(message),
    key: key,
    date: date
    }
  end
end
