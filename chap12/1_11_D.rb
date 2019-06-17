def assign_color
  color_id = 1
  $n.times do |i|
    if $color[i].nil?
      $s << i
      while !$s.empty?
        u = $s.pop
        dfs(u, color_id)
      end
      color_id += 1
    end
  end
end

def dfs(u, color_id)
  # 再帰だとstack level too deep (SystemStackError) が出てしまうので、
  # スタックを用いる。
  # puts "unit: #{u}, #{$color.join(' ')}"
  $color[u] = color_id
  $g[u].each do |v|
    if $color[v].nil?
      $s << v
    end
  end
end


$n, m = gets.split.map(&:to_i)
$g = Array.new($n) { Array.new() }
m.times do
  u, f = gets.split.map(&:to_i)
  $g[u] << f
  $g[f] << u
end

$s = []
$color = Array.new($n, nil)
assign_color

q = gets.to_i
q.times do
  s, t = gets.split.map(&:to_i)
  if $color[s] == $color[t]
    puts 'yes'
  else
    puts 'no'
  end
end