class Shift
  attr_reader :key, :date

  def initialize(key = Array.new(5){rand(10)}, date = DateTime.now.strftime('%d%m%y'))
    @key = key
    @date = date
  end

  def key_split
    doubles = []
    key.split(//).each_cons(2) do |inner_numbers|
      doubles << inner_numbers.join.to_i
    end
    doubles
  end

  def date_split
    square = date.to_i ** 2
    last_4 = square.to_s[-4..-1].split("")
    last_4.map do |last|
      last.to_i
    end
  end

  def combine
    both = []
    key_split.each_index { |i| both[i] = key_split[i] + date_split[i] }
    both
  end

  def message(message)
    split_message = message.downcase.split(//)
    split_message
  end

  def shift_size(message)
    shifts = combine
    size = []
    message.length.times do
      size << shifts[0]
      shifts.rotate!
    end
    size
  end

  def og_alpha
    ("a".."z").to_a << " "
  end

  def combine_index
    combine.map.with_index(0).to_a
  end

  def message_index(message)
    divided = message(message)
    divided.map.with_index(0).to_a
  end
end
