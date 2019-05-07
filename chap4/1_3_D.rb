class MyStack
  def initialize(max)
    @top = 0
    @max = max
    @s = Array.new(max)
  end

  def is_empty?
    @top == 0
  end

  def is_full?
    @top >= (@max -1)
  end

  def push(x)
    if is_full?
      raise "overflow"
    end
    @top += 1
    @s[@top] = x
  end

  def pop
    if is_empty?
      raise "underflow"
    end
    @top -=1
    @s[@top+1]
  end

  def dump
    puts @s
  end

  def print
    results = []
    while (!is_empty?) do
      results << pop[1]
    end
    pools = results.empty? ? '' : ' ' + results.reverse.join(' ')
    puts results.length.to_s + pools
  end
end

inputs = gets.split('')

s1 = MyStack.new(20000)
s2 = MyStack.new(10000)
total = 0
is_contiguous = false
inputs.each_with_index do |x, i|
  case x
  when "\\"
    s1.push(i)
    is_contiguous = false
  when "/"
    if s1.is_empty?
      next
    end

    position = s1.pop()
    area = i - position
    total += area
    total_prev_area = 0
    stack_position = position + 1
    while (!s2.is_empty?)
      prev_position, prev_area = s2.pop()
      if prev_position < position
        s2.push([prev_position, prev_area])
        break
      end
      total_prev_area += prev_area
      stack_position = prev_position
    end

    s2.push([stack_position -1, total_prev_area + area])
  when "_"
    next
  end
end

puts total
# s2.dump
s2.print