class MyQueue
  def initialize(size)
    @head = @tail = 0
    @size = size
    @q = Array.new(size)
  end

  def empty?
    @head == @tail
  end

  def full?
    @head == (@tail + 1) % @size
  end

  def enqueue(x)
    if full?
      raise "overflow"
    end

    @q[@tail] = x
    if @tail + 1 == @size
      @tail = 0
    else
      @tail += 1
    end
  end

  def dequeue
    raise 'underflow' if empty?

    x = @q[@head]
    if @head + 1 == @size
      @head = 0
    else
      @head += 1
    end

    x
  end
end

class MyProcess
  attr_accessor :name, :time
  def initialize(name, time)
    @name = name
    @time = time
  end

  def proc(proc_time)
    if @time <= proc_time
      rest_time = proc_time - @time
      @time = 0
    else
      @time -= proc_time
      rest_time = 0
    end
    rest_time
  end

  def ended?
    time.zero?
  end
end

n, q = gets().split.map(&:to_i)
que = MyQueue.new(n + 1)
n.times do
  name, time = gets().split
  time = time.to_i
  que.enqueue(MyProcess.new(name, time))
end

total_time = 0
while n > 0 do
  process = que.dequeue
  rest_time = process.proc(q)
  total_time += (q - rest_time)
  if process.ended?
    puts process.name + " " + total_time.to_s
    n -= 1
  else
    que.enqueue(process)
  end
end
