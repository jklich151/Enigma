class Shift
  attr_reader :key, :date

  def initialize(key = rand.to_s[2..6], date = DateTime.now.strftime('%d%m%y'))
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

  def split_message(message)
    message.downcase.split(//)
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
    divided = split_message(message)
    divided.map.with_index(0).to_a
  end

  def shifted_alpha(message)
    split_message(message).map.with_index do |char, index|
      og_alpha.rotate(shift_size(message)[index])
    end
  end

  def new_message(message)
    split_message(message).map.with_index do |char, index|
      char.tr(og_alpha.join, shifted_alpha(message)[index].join)
    end.join
  end

  def change_back(message)
    split_message(message).map.with_index do |char, index|
      char.tr(shifted_alpha(message)[index].join, og_alpha.join)
    end.join
  end
end
