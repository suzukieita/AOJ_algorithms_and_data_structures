class MyDictionary
  def initialize(size)
    @m = size
    @t = {}
  end

  def insert(key)
    i = 0
    while true
      j = h(convert(key), i)
      if @t[j].nil?
        @t[j] = key
        return
      else
        i += 1
      end
    end
  end

  def search(key)
    i = 0
    while true
      j = h(convert(key), i)
      if @t[j] == key
        return true
      elsif @t[j].nil? || i >= @m
        return false
      else
        i += 1
      end
    end
  end

  def convert(key)
    # key.chars { |ch| ch.ord[0] }
    # key.split('').map{ |s| s.ord[0] }.join('').to_i
    # key.chars.to_a.map{ |s| s.ord[0] }.join('').to_i
    key.tr("ACGT", "1234").to_i
  end

  # def code2num(s)
  #   case s
  #   when "A"
  #     return 1
  #   when "C"
  #     return 2
  #   when "G"
  #     return 3
  #   when "T"
  #     return 4
  #   end
  # end

  def h(key, i)
    (h1(key) + i * h2(key)) % @m
  end

  def h1(key)
    key % @m
  end

  def h2(key)
    1 + (key % (@m -1))
  end

  def exec(order, key)
    case order
    when "insert"
      insert(key)
    when "find"
      if search(key)
        puts "yes"
      else
        puts "no"
      end
    end
  end
end

n = gets.to_i
dict = MyDictionary.new(2079403)
n.times do
  order, key = gets.split
  dict.exec(order, key)
end

# start_time = Time.now
# n = 13
# "insert AAA
# insert AAC
# insert AGA
# insert AGG
# insert TTT
# find AAA
# find CCC
# find CCC
# insert CCC
# find CCC
# insert T
# find TTT
# find T
# ".split("\n").each do | o | 
#   order, key = o.split
#   dict.exec(order, key)
# end

# p "処理概要 #{Time.now - start_time}s"
