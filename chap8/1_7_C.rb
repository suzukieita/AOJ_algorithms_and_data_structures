class MyBinaryNode
  attr_accessor :parent, :left, :right

  def initialize
    @parent = -1
    @left = -1
    @right = -1
  end
end

def pre_order(nodes, id)
  if id == -1
    return 
  end
  print ' '
  print id
  pre_order(nodes, nodes[id].left)
  pre_order(nodes, nodes[id].right)
end

def in_order(nodes, id)
  if id == -1
    return 
  end
  in_order(nodes, nodes[id].left)
  print ' '
  print id
  in_order(nodes, nodes[id].right)
end

def post_order(nodes, id)
  if id == -1
    return 
  end
  post_order(nodes, nodes[id].left)
  post_order(nodes, nodes[id].right)
  print ' '
  print id
end

n = gets.to_i
nodes = []
n.times do
  nodes << MyBinaryNode.new
end

n.times do
  inputs = gets.split.map(&:to_i)
  node_id = inputs.shift
  node = nodes[node_id]
  left = inputs.shift
  if left != -1
    node.left = left
    left_node = nodes[left]
    left_node.parent = node_id
  end
  right = inputs.shift
  if right != -1
    node.right = right
    right_node = nodes[right]
    right_node.parent = node_id
  end
end

root_id = nil
nodes.each_with_index do |node, i|
  if node.parent == -1
    root_id = i
  end
end

puts "Preorder"
pre_order(nodes, root_id)
puts ""

puts "Inorder"
in_order(nodes, root_id)
puts ""

puts "Postorder"
post_order(nodes, root_id)
puts ""