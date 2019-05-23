def parent(i)
  ( i / 2 ).ceil
end

def right(i)
  2 * i + 1
end

def left(i)
  2 * i
end

n = gets.to_i
heap = gets.split.map(&:to_i)
heap.each_with_index do |x, i|
  i = i + 1
  print "node #{i}: key = #{x}, "
  if parent(i) >= 1
    print "parent key = #{heap[parent(i) - 1]}, "
  end
  if left(i) <= n
    print "left key = #{heap[left(i) - 1]}, "
  end
  if right(i) <= n
    print "right key = #{heap[right(i) - 1]}, "
  end
  puts ""
end