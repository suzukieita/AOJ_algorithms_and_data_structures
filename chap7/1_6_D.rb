def solve(arr)
  sorted = arr.sort
  n = arr.length
  used = Array.new(n, false)
  minimum = arr.min
  max = arr.max
  circle_index = Array.new(max)
  arr.each_with_index do |v, i|
    circle_index[v] = i
  end
  # puts circle_index

  ans = 0
  arr.each_with_index do |v, i|
    if used[i]
      next
    end
    if sorted[i] == v
      used[i] = true
      next
    end
    cur_i = i
    m = v
    s = v
    cur_n = 1
    used[i] = true
    while true
      cur_i = circle_index[sorted[cur_i]]
      if used[cur_i] 
        break
      end
      # puts "i: #{i}, cur_i: #{cur_i}, m: #{m} s: #{s}"
      m = [m, arr[cur_i]].min
      s += arr[cur_i]
      cur_n += 1
      used[cur_i] = true
    end
    ans += [(s + (cur_n - 2) * m), (s + m + (cur_n + 1) * minimum)].min
  end
  ans
end

n = gets.to_i
arr = gets.split.map(&:to_i)
puts solve(arr)
