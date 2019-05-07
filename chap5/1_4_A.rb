def linear_search(arr, key)
  n = arr.length
  arr[n] = key
  i = 0
  while arr[i] != key do
    i += 1
  end
  if i == n
    return false
  end
  return true
end

n = gets.to_i
s = gets.split.map(&:to_i)
q = gets.to_i
t = gets.split.map(&:to_i)
cnt = 0
t.each do |key|
  cnt += 1 if linear_search(s, key)
end
puts cnt