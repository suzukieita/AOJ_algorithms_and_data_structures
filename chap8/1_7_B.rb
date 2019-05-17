class MyBinaryNode
  attr_accessor :parent, :left, :right

  def initialize
    @parent = -1
    @left = -1
    @right = -1
  end

  def sibling(self_id, nodes)
    if @parent == -1
      return -1
    else
      parent = nodes[@parent]
      if parent.right == self_id
        return parent.left
      else
        return parent.right
      end
    end
  end

  def depth(nodes)
    if @parent == -1
      return 0
    else
      return nodes[@parent].depth(nodes) + 1
    end
  end

  def height(nodes)
    if @right == -1 && @left == -1
      return 0
    elsif @right == -1 && @left != -1
      return nodes[@left].height(nodes) + 1
    elsif @right != -1 && @left == -1
      return nodes[@right].height(nodes) + 1
    else
      return [nodes[@right].height(nodes),nodes[@left].height(nodes)].max + 1
    end
  end

  def degree
    degree = 0
    if @right != -1
      degree += 1
    end
    if @left != -1
      degree += 1
    end
    return degree
  end

  def type
    if @parent == -1
      "root"
    elsif @left != -1 || @right != -1
      "internal node"
    else
      "leaf"
    end
  end
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
  if node.parent.nil?
    node.parent = -1
    root_id = i
  end
end

# set_depth(nodes, root_id, 0)

nodes.each_with_index do |node, i|
  puts "node #{i}: parent = #{node.parent}, sibling = #{node.sibling(i, nodes)}, degree = #{node.degree}, depth = #{node.depth(nodes)}, height = #{node.height(nodes)}, #{node.type}"
end