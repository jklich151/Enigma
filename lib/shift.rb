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
end
