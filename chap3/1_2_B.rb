n = gets().to_i
arr = gets().split.map(&:to_i)

def selection_sort(n, arr)
  cnt = 0
  for i in 0...n
    minj = i
    for j in i...n
      if arr[j] < arr[minj]
        minj = j
      end
    end
    if i != minj
      arr[i], arr[minj] = arr[minj], arr[i]
      cnt += 1
    end
  end
  return arr, cnt
end

arr, cnt = selection_sort(n, arr)
puts arr.join(' ')
puts cnt