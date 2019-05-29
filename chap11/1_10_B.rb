def matrix_chain_mutliplication(n, m, p)
  for l in 2..n
    for i in 1..n - l + 1
      j = i + l - 1
      m[i][j] = Float::INFINITY
      for k in i..j-1
        m[i][j] = [m[i][j], m[i][k] + m[k + 1][j] + p[i - 1] * p[k] * p[j]].min
      end
    end
  end
end

n = gets.to_i
m = Array.new(n+1) { Array.new(n+1, 0) }
p = []
n.times do |i|
  r, c = gets.split.map(&:to_i)
  if i.zero?
    p << r
  end
  p << c
end
matrix_chain_mutliplication(n, m, p)
puts m[1][n]