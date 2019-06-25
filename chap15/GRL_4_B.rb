module Color
  WHITE = 0
  GRAY = 1
  BLACK = 2
end
def topological_sort(n)
  $color = Array.new(n, Color::WHITE)
  n.times do |u|
    if $indeg[u].zero? && $color[u] == Color::WHITE
      bfs(u)
    end
  end
end

def bfs(s)
  q = []
  q << s
  $color[s] = Color::GRAY
  while !q.empty?
    u = q.shift

    $out << u

    for v in $g[u]
      $indeg[v] -= 1
      if $indeg[v].zero? && $color[v] == Color::WHITE
        $color[v] = Color::GRAY
        q.push(v)
      end
    end
  end
end



v, e = gets.split.map(&:to_i)
$g = Array.new(v) { [] }
$indeg = Array.new(v, 0)
e.times do
  s, t = gets.split.map(&:to_i)
  $g[s] << t
  $indeg[t] += 1
end
$out = []

topological_sort(v)

for u in $out
  puts u
end

