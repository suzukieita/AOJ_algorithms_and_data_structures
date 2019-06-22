def floyd(n)
  n.times do |k|
    n.times do |i|
      if $d[i][k] == Float::INFINITY
        next
      end
      n.times do |j|
        if $d[k][j] == Float::INFINITY
          next
        end
        $d[i][j] = [$d[i][j], $d[i][k] + $d[k][j]].min
      end
    end
  end
end

n, e = gets.split.map(&:to_i)
$d = Array.new(n) { Array.new(n) }
n.times do |i|
  n.times do |j|
    $d[i][j] = i == j ? 0 : Float::INFINITY
  end
end

e.times do
  s, t, d = gets.split.map(&:to_i)
  $d[s][t] = d
end

floyd(n)

n.times do |i|
  if $d[i][i].negative?
    puts "NEGATIVE CYCLE"
    exit
  end
end

n.times do |i|
  n.times do |j|
    unless j.zero?
      print ' '
    end
    if $d[i][j] == Float::INFINITY
      print 'INF'
    else
      print $d[i][j]
    end
  end
  puts
end