n = gets.to_i
m = Array.new(n) { Array.new(n, 0) }
n.times do
  u, k, *v_arr = gets.split.map(&:to_i)
  for v in v_arr
    m[u-1][v-1] = 1
  end
end
for u in m
  puts u.join(' ')
end