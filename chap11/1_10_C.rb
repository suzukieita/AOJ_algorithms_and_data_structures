def lcs(x, y)
  m = x.length
  n = y.length
  # maxl = 0
  c = Array.new(m+1) { Array.new(n+1, 0) }
  for i in 1..m
    for j in 1..n
      if x[i-1] == y[j-1]
        c[i][j] = c[i - 1][j - 1] + 1
      elsif c[i - 1][j] >= c[i][j - 1]
        c[i][j] = c[i - 1][j]
      else
        c[i][j] = c[i][j - 1]
      end
      # maxl = [maxl, c[i][j]].max
      # puts c.join(' ')
      # puts "c[1][3] : #{c[1][3]}"
      # puts "x: #{x[i]}, `y: #{y[j]}, i: #{i}, j: #{j}, c[i][j]: #{c[i][j]}, c[i-1][j-1]: #{c[i-1][j-1]}, maxl: #{maxl}"
    end
  end
  c[m][n]
end

gets.to_i.times do
  x = gets.chomp.chars
  y = gets.chomp.chars
  puts lcs(x, y)
end