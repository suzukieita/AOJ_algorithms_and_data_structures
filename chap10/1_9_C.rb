def insert(arr, key)
  $h += 1
  arr[$h] = - 1.0/0
  heap_increase_key(arr, $h, key)
end

def heap_increase_key(arr, i, key)
  if key < arr[i]
    raise "NEW_KEY_SMALLER_THAN_CURRENT_KEY"
  end
  arr[i] = key
  while i > 1 && arr[parent(i)] < arr[i] do
    arr[i], arr[parent(i)] = arr[parent(i)], arr[i]
    i = parent(i)
  end
end

def heap_extract_max(arr)
  if $h < 1
    raise "HEAP_UNDERFLOW"
  end
  max = arr[1]
  arr[1] = arr.pop
  $h -= 1
  max_heapify(arr, 1)
  max
end

def parent(i)
  ( i / 2 ).ceil
end

def right(i)
  2 * i + 1
end

def left(i)
  2 * i
end

def max_heapify(arr, i)
  l = left(i)
  r = right(i)
  h = arr.size - 1

  # puts "i : #{i}, l : #{l}, r : #{r}, h : #{h} arr[r] : #{arr[r]}, arr : #{arr}"

  largest = nil
  if l <= h && arr[l] > arr[i]
    largest = l
  else
    largest = i
  end
  if r <= h && arr[r] > arr[largest]
    largest = r
  end

  if largest != i
    arr[i], arr[largest] = arr[largest], arr[i]
    max_heapify(arr, largest)
  end
end

$h = 0
arr = [nil]
while true do
  order, key = gets.split
  key = key.to_i
  case order
  when "end"
    break
  when "insert"
    insert(arr, key)
  when "extract"
    max = heap_extract_max(arr)
    puts max
  end
  # puts "array : #{arr.join(' ')}"
end