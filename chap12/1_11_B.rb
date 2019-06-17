# 再帰を用いて実装
module Color
   WHITE = 0
   GRAY = 1
   BLACK = 2
end
def dfs(u)
  # puts "unit : #{u}, color : #{$color[u]}"
  $color[u] = Color::GRAY
  $d[u] = $time
  $time += 1
  for v in 0...($m.size) do
    if !$m[u][v].zero? && $color[v] == Color::WHITE
      # puts "HIT! unit : #{v}, color : #{$color[v]}"
      dfs(v)
    end
  end
  $color[u] = Color::BLACK
  $f[u] = $time
  $time += 1
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
$d = Array.new(n)
$f = Array.new(n)
n.times do |u|
  if $color[u] == Color::WHITE
    dfs(u)
  end
end
for i in 0...n do
  print i+1
  print ' '
  print $d[i]
  print ' '
  puts $f[i]
end