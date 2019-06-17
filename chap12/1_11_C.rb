# 再帰を用いて実装
module Color
   WHITE = 0
   GRAY = 1
   BLACK = 2
end
def bfs(u)
  $color[u] = Color::BLACK

  for v in 0...($m.size) do
    if !$m[u][v].zero? && $color[v] == Color::WHITE
      # puts "HIT! unit : #{v}, color : #{$color[v]}"
      $color[v] = Color::GRAY
      $d[v] = $d[u] + 1
      $q << v
    end
  end
  
end

n = gets.to_i
$m = Array.new(n) { Array.new(n, 0) }
n.times do
  u, k, *v_arr = gets.split.map(&:to_i)
  for v in v_arr
    $m[u-1][v-1] = 1
  end
end
# for u in $m
#   puts u.join(' ')
# end
$time = 1
$color = Array.new(n, Color::WHITE)
$d = Array.new(n, -1)
$q = []
$q << 0
$d[0] = 0
while !$q.empty? do
  u = $q.shift
  bfs(u)
end
for i in 0...n do
  print i+1
  print ' '
  puts $d[i]
end