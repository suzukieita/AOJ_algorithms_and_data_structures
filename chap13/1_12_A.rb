  module Color
  WHITE = 0
  GRAY = 1
  BLACK = 2
end

def prim()
  d = Array.new($n, Float::INFINITY)
  color = Array.new($n, Color::WHITE)
  p = Array.new($n, -1)
  
  d[0] = 0

  while true
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
      if color[v] != Color::BLACK && $m[u][v] != Float::INFINITY
        if $m[u][v] < d[v]
          d[v] = $m[u][v]
          p[v] = u
          color[v] = Color::GRAY
        end
      end
    end
  end
  sum = 0
  $n.times do |i|
    if p[i] !=- 1
      sum += $m[i][p[i]]
    end
  end
  sum
end

$n = gets.to_i
$m = Array.new($n) { Array.new($n) }
$n.times do |i|
  arr = gets.split.map(&:to_i)
  $n.times do |j|
    $m[i][j] = arr[j] == -1 ? Float::INFINITY : arr[j]
  end
end
puts prim()
