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

n = gets.to_i
arr = gets.split.map(&:to_i)
arr.unshift(nil)
(n/2).downto(1) do |i|
  max_heapify(arr, i)
end
arr.shift
arr.each { |v| print " #{v}"}
puts ""