def solve(i, m)
  if m == 0
    return true
  end
  if i >= $n
    return false
  end
  return solve(i+1, m) || solve(i+1, m - $arr[i])
end

$n = gets.to_i
$arr = gets.split.map(&:to_i)
q = gets
m_arr = gets.split.map(&:to_i)
m_arr.each do |m|
  if solve(0, m)
    puts "yes"
  else
    puts "no"
  end
end