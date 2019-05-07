def partition(arr, p, r)
  x = arr[r]
  i = p - 1
  for j in p...r
    if arr[j] <= x
      i += 1
      arr[i], arr[j] = arr[j], arr[i]
    end
  end
  arr[i + 1], arr[r] = arr[r], arr[i + 1]
  return i + 1
end

n = gets.to_i
arr = gets.split.map(&:to_i)
index = partition(arr, 0, n - 1)
for i in 0...index
  print arr[i].to_s + ' '
end
print '[' + arr[index].to_s + ']'
for i in index+1...n
  print ' ' + arr[i].to_s
end
print "\n"