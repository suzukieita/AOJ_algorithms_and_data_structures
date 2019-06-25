require 'set'

def article_point(n)
  $timer = 1

  dfs(0)

  # puts "prenum: #{$prenum}, lowest: #{$lowest}, parent: #{$parent}"

  ap = Set.new
  root_num = 0
  n.times do |i|
    p = $parent[i]
    if p == -1
      next
    end
    # puts "i: #{i}, p: #{p}, $prenum[p]: #{$prenum[p]}, $lowest[i]: #{$lowest[i]}"
    if p.zero?
      root_num += 1
    elsif $prenum[p] <= $lowest[i]
      ap << p
    end
  end
  if root_num > 1
    ap << 0
  end
  ap = ap.sort
  ap.each do |i|
    puts i
  end

  
end

# stack level too deep (SystemStackError)
# def dfs(current, prev)
#   $visits[current] = true
#   $prenum[current] = $timer
#   $lowest[current] = $timer
#   $timer += 1
#   # puts "current : #{current}, prev : #{prev}, prenum: #{$prenum}, lowest: #{$lowest}"

#   for next_node in $g[current]
#     # puts "next : #{next_node}, visited? : #{$visits[next_node]}"
#     if !$visits[next_node]
#       $parent[next_node] = current
#       dfs(next_node, current)
#       $lowest[current] = [$lowest[current], $lowest[next_node]].min
#     elsif next_node != prev
#       $lowest[current] = [$lowest[current], $prenum[next_node]].min
#     end
#   end
# end

def dfs(current)
  $visits[current] = true
  $prenum[current] = $timer
  $lowest[current] = $timer
  $timer += 1
  # puts "current : #{current}, prev : #{prev}, prenum: #{$prenum}, lowest: #{$lowest}"

  stack = []
  stack << current

  while !stack.empty? do
    n = stack[-1]
    found = false

    # puts "n: #{n}, prenum: #{$prenum}, lowest: #{$lowest}, parent: #{$parent}"

    for next_node in $g[n]
      # puts "next : #{next_node}, visited? : #{$visits[next_node]}"
      if !$visits[next_node]
        $parent[next_node] = n
        
        # dfs(next_node, current)
        $visits[next_node] = true
        $prenum[next_node] = $timer
        $lowest[next_node] = $timer
        $timer += 1

        stack << next_node

        $lowest[n] = [$lowest[n], $lowest[next_node]].min
        found = true
        break
      elsif next_node != $parent[n]
        $lowest[n] = [$lowest[n], $prenum[next_node]].min
      end
    end
    unless found
      stack.pop
      for next_node in $g[n]
        if next_node == stack[-1]
          next
        end
        # puts "n: #{n}, next: #{next_node}, $lowest[n]: #{$lowest[n]}, $lowest[next]: #{$lowest[next_node]}"
        $lowest[n] = [$lowest[n], $lowest[next_node]].min
      end
    end
  end
end

v, e = gets.split.map(&:to_i)
$g = Array.new(v) {[]}
e.times do
  s, t = gets.split.map(&:to_i)
  $g[s] << t
  $g[t] << s
end
# puts 
# v.times do |i|
#   puts "NO.#{i}"
#   puts $g[i].join(' ')
# end
$prenum = Array.new(v)
$lowest = Array.new(v)
$parent = Array.new(v, -1)
$visits = Array.new(v, false)
article_point(v)