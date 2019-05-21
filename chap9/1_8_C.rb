class MyBinaryNode
  attr_accessor :parent, :left, :right, :v
  attr_reader :id

  def initialize(id, v)
    @id = id
    @parent = nil
    @left = nil
    @right = nil
    @v = v
  end

  def to_s
    @v
  end
end

def pre_order(node)
  if node.nil?
    return 
  end
  print ' '
  print node.v
  pre_order(node.left)
  pre_order(node.right)
end

def in_order(node)
  if node.nil?
    return 
  end
  in_order(node.left)
  print ' '
  print node.v
  in_order(node.right)
end

# def post_order(nodes, id)
#   if id.nil?
#     return 
#   end
#   post_order(nodes, nodes[id].left)
#   post_order(nodes, nodes[id].right)
#   print ' '
#   print id
# end

def print_nodes(node)
  in_order(node)
  puts ""
  pre_order(node)
  puts ""
end

def insert(z, root)
  y = nil
  x = root
  while !x.nil? do
    y = x
    if z.v < x.v
      x = x.left
    else
      x = x.right
    end
  end
  
  z.parent = y

  if y.nil?
    # skip
  elsif z.v < y.v
    y.left = z
  else
    y.right = z
  end

end

def find(x, k)
  while !x.nil? && k != x.v do
    if k < x.v
      x = x.left
    else
      x = x.right
    end
  end

  x
end

def delete(z)
  if z.left.nil? && z.right.nil?
    p = z.parent
    if p.left&.v == z.v
      p.left = nil
    else
      p.right = nil
    end
  elsif z.left && z.right
    next_node = get_successor(z)
    z.v = next_node.v
    delete(next_node)
  else
    p = z.parent
    c = z.left || z.right
    if p.left&.v == z.v
      p.left = c
    else
      p.right = c
    end
    c.parent = p
    
  end
end

def get_successor(x)
  if x.right
    return get_minimum(x.right)
  end

  y = x.parent
  while y && x == y.right
    x = y
    y = y.parent
  end
  return y
end

def get_minimum(x)
  while x.left
    x = x.left
  end
  x
end


n = gets.to_i
root = nil
i = 0
n.times do
  order, v = gets.split
  v = v.to_i
  case order
  when "insert"
    node = MyBinaryNode.new(i, v)
    insert(node, root)
    if i == 0
      root = node
    end
    i += 1
  when "print"
    print_nodes(root)
  when "find"
    if find(root, v)
      puts "yes"
    else
      puts "no"
    end
  when "delete"
    target_node = find(root, v)
    delete(target_node)
  end
end