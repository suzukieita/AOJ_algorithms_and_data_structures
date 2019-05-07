def binary_search(arr, max, k)
  left = 0
  right = max
  while left < right do
    mid = (left + right) / 2
    if can_load?(arr.dup, k, mid)
      right = mid
    else
      left = mid + 1
    end
  end
  return left
end

def can_load?(arr,k, p)
  k.times do
    k_load = 0
    while true
      if arr.length == 0
        break
      end

      if k_load + arr[0] <= p
        k_load += arr.shift
      else
        break
      end
    end
  end
  arr.length == 0
end

n, k = gets.split.map(&:to_i)
arr = []
n.times do
  arr << gets.to_i
end
max = 100000 * 10000
ans = binary_search(arr, max, k)
puts ans