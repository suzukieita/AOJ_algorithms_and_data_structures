def binary_search(arr, n, key)
  left = 0
  right = n
  while left < right do
    mid = (left + right) / 2
    if arr[mid] == key
      return true
    elsif arr[mid] < key
      left = mid + 1
    elsif arr[mid] > key
      right = mid
    end
  end
  return false
end

n = gets.to_i
s = gets.split.map(&:to_i)
q = gets.to_i
t = gets.split.map(&:to_i)
cnt = 0
t.each do |key|
  cnt += 1 if binary_search(s, n, key)
end
puts cnt