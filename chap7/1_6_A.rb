def counting_sort(arr_a, arr_b, k)
  arr_c = Array.new(k+1, 0)
  
  arr_a.each do |v|
    arr_c[v] += 1
  end

  for i in 1..k
    arr_c[i] = arr_c[i] + arr_c[i-1]
  end

  # n = arr_a.length
  # for j in (n-1).downto(0)
  #   arr_b[arr_c[arr_a[j]] - 1] = arr_a[j]
  #   arr_c[arr_a[j]] -= 1
  # end
  arr_a.reverse_each do |v|
    arr_b[arr_c[v] - 1] = v
    arr_c[v] -= 1
  end

end

n = gets.to_i
arr = gets.split.map(&:to_i)
arr_b = Array.new(n)
counting_sort(arr, arr_b, arr.max)
puts arr_b.join(' ')