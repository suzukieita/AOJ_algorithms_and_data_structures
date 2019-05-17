class MyNode
  attr_accessor :parent, :left_child, :right_sibling, :depth

  def type
    if @parent == -1
      "root"
    elsif @left_child
      "internal node"
    else
      "leaf"
    end
  end

  def depth(nodes)
    if @parent == -1
      return 0
    else
      return nodes[@parent].depth(nodes) + 1
    end
  end

end

def set_depth(nodes, i, d)
  node = nodes[i]
  node.depth = d
  if node.left_child
    set_depth(nodes, node.left_child, d + 1)
  end
  if node.right_sibling
    set_depth(nodes, node.right_sibling, d)
  end
end


n = gets.to_i
nodes = []
n.times do
  nodes << MyNode.new
end


n.times do
  inputs = gets.split.map(&:to_i)
  node_id = inputs.shift
  node = nodes[node_id]
  d = inputs.shift
  prev_id = nil
  inputs.each_with_index do | c_id, i|
    nodes[c_id].parent = node_id
    if i.zero?
      node.left_child = c_id
    else
      nodes[prev_id].right_sibling = c_id
    end
    prev_id = c_id
  end
end

root_id = nil
nodes.each_with_index do |node, i|
  if node.parent.nil?
    node.parent = -1
    root_id = i
  end
end

# set_depth(nodes, root_id, 0)

nodes.each_with_index do |node, i|
  childlen_ids = []
  if node.left_child
    childlen_ids << node.left_child
    child_node = nodes[node.left_child]
    while child_node.right_sibling
      childlen_ids << child_node.right_sibling
      child_node = nodes[child_node.right_sibling]
    end
  end

  puts "node #{i}: parent = #{node.parent}, depth = #{node.depth(nodes)}, #{node.type}, [#{childlen_ids.join(', ')}]"
end