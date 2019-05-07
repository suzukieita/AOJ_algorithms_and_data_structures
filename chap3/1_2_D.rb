def generate_g(n)
  g = [1]
  while 3 * g[-1] + 1 < n
    g << 3 * g[-1] + 1
  end
  g.reverse
end

def insertion_sort(arr, n, g)
  cnt = 0
  for i in g...n
    v = arr[i]
    j = i - g
    while j >= 0 && arr[j] > v
      arr[j+g] = arr[j]
      j -= g
      cnt += 1
    end
    arr[j+g] = v
  end
  cnt
end

def sehll_sort(arr, n)
  total_cnt = 0
  g_arr = generate_g(n)
  g_arr.each do |g|
    cnt = insertion_sort(arr, n, g)
    total_cnt += cnt
  end
  return g_arr, total_cnt
end

n = gets().to_i
arr = []
n.times do 
  arr << gets().to_i
end

g, cnt = sehll_sort(arr, n)
puts g.length
puts g.join(' ')
puts cnt
arr.each do |num|
  puts num
end