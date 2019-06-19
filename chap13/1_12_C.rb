# 優先度付きキューを用いないと速度的に無理
module Color
  WHITE = 0
  GRAY = 1
  BLACK = 2
end

class MyNode
  attr_reader :v, :c
  def initialize(v, c)
    @v = v
    @c = c
  end
end

class PriorityQueue

  def initialize
    @arr = []
    @h = 0
  end

  def insert(node)
    @h += 1
    @arr[@h] = - 1.0/0
    heap_increase_key(@h, node)
    # puts "h : #{@h}"
  end

  def heap_increase_key(i, node)
    @arr[i] = node
    while i > 1 && @arr[parent(i)].c < @arr[i].c do
      @arr[i], @arr[parent(i)] = @arr[parent(i)], @arr[i]
      i = parent(i)
    end
  end

  def heap_extract_max()
    # puts "h : #{@h} extract"
    # puts "arr : #{@arr}"
    # puts "empty? : #{empty?}"
    if @h < 1
      raise "HEAP_UNDERFLOW"
    end
    max = @arr[1]
    @arr[1] = @arr.pop
    @h -= 1
    max_heapify(1)
    # puts "arr : #{@arr}"
    max
  end

  def parent(i)
    ( i / 2 ).ceil
  end

  def right(i)
    2 * i + 1
  end

  def left(i)
    2 * i
  end

  def max_heapify(i)
    l = left(i)
    r = right(i)
    h = @arr.size - 1

    # puts "i : #{i}, l : #{l}, r : #{r}, h : #{h} arr[r] : #{arr[r]}, arr : #{arr}"

    largest = nil
    if l <= h && @arr[l].c > @arr[i].c
      largest = l
    else
      largest = i
    end
    if r <= h && @arr[r].c > @arr[largest].c
      largest = r
    end

    if largest != i
      @arr[i], @arr[largest] = @arr[largest], @arr[i]
      max_heapify(largest)
    end
  end

  def empty?
    @h == 0
  end
end

def dijkstra(s)
  d = Array.new($n, Float::INFINITY)
  color = Array.new($n, Color::WHITE)
  d[s] = 0

  pq = PriorityQueue.new
  pq.insert(MyNode.new(0, 0))
  

  while !pq.empty?
    # puts d.join(' ')
    # puts pq
    
    node = pq.heap_extract_max
    u = node.v
    cost = node.c

    # puts $adj[u].join(' ')
    # puts "====="

    color[u] = Color::BLACK

    if d[u] < cost * -1
      next
    end

    $adj[u].each do | vc |
      v = vc[0]
      c = vc[1]
      # puts "vc: #{vc}, v: #{v}, c: #{c}"
      if color[v] == Color::BLACK
        next
      end
      if d[u] + c < d[v]
        d[v] = d[u] + c
        color[v] = Color::GRAY
        pq.insert(MyNode.new(v, d[v] * -1))
      end
    end
  end
  d
end

$n = gets.to_i
$adj = Array.new($n) { [] }
$n.times do |i|
  u, k, *arr = gets.split.map(&:to_i)
  arr.each_slice(2) do |v, c|
    $adj[u] << [v, c]
  end
end
# puts "====="
# $m.each do |k|
#   puts k.join(' ')
# end
# puts "====="

d = dijkstra(0)
d.each_with_index do | v, i |
  puts "#{i} #{v}"
end
