module Color
  WHITE = 0
  GRAY = 1
  BLACK = 2
end

def dijkstra(s)
  d = Array.new($n, Float::INFINITY)
  color = Array.new($n, Color::WHITE)
  p = Array.new($n, -1)
  
  d[s] = 0

  while true
    # puts d.join(' ')
    mincost = Float::INFINITY
    u = nil
    $n.times do |i|
      if color[i] != Color::BLACK && d[i] < mincost
        mincost = d[i]
        u = i
      end
    end

    if mincost == Float::INFINITY
      break
    end

    color[u] = Color::BLACK

    $n.times do |v|
      if color[v] != Color::BLACK && $m[u][v]
        if d[u] + $m[u][v] < d[v]
          d[v] = d[u] + $m[u][v]
          p[v] = u
          color[v] = Color::GRAY
        end
      end
    end
  end
  d
end

$n = gets.to_i
$m = Array.new($n) { Array.new($n) }
$n.times do |i|
  u, k, *arr = gets.split.map(&:to_i)
  arr.each_slice(2) do |v, c|
    $m[u][v] = c
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
