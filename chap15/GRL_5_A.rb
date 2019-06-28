# 優先度付きキューを用いないと速度的に無理
module Color
  WHITE = 0
  GRAY = 1
  BLACK = 2
end

def bfs(s)
  d = Array.new($n, Float::INFINITY)
  q = []
  q << s
  d[s] = 0
  while !q.empty? do
    u = q.shift
    $g[u].each do | edge |
      t = edge[0]
      if d[t] == Float::INFINITY
        d[t] = d[u] + edge[1]
        q << t
      end
    end
  end
  d
end

$n = gets.to_i
$g = Array.new($n) { [] }
($n-1).times do |i|
  s, t, w = gets.split.map(&:to_i)
  $g[s] << [t, w]
  $g[t] << [s, w]
end


d = bfs(0)
maxv = 0
tgt = 0
d.each_with_index do | v, i |
  if v == Float::INFINITY
    next
  end
  if maxv < v
    maxv = v
    tgt = i
  end
end

d = bfs(tgt)
maxv = 0
d.each do |v|
  if v == Float::INFINITY
    next
  end
  if maxv < v
    maxv = v
  end
end
puts maxv