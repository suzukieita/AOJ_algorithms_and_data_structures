def merge(arr, left, mid, right)
  n1 = mid - left
  n2 = right - mid
  l = []
  for i in 0...n1
    l << arr[left + i]
  end
  r = []
  for i in 0...n2
    r << arr[mid + i]
  end
  l << Float::INFINITY
  r << Float::INFINITY
  i = 0
  j = 0
  for k in left...right
    if l[i] <= r[j]
      arr[k] = l[i]
      i += 1
    else
      arr[k] = r[j]
      j += 1
      $cnt += n1 - i
    end
  end
end

def merge_sort(arr, left, right)
  if left + 1 < right
    mid = (left + right) / 2
    merge_sort(arr, left, mid)
    merge_sort(arr, mid, right)
    merge(arr, left, mid, right)
  end
end

n = gets.to_i
s = gets.split.map(&:to_i)
$cnt = 0
merge_sort(s, 0, n)
puts $cnt