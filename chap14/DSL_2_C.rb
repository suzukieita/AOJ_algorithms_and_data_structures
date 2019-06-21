class DTree
  def initialize(p, n)
    # @p = p
    @t = Array.new(n)
    @np = 0
    makeDTree(0, n, p, 0)
  end

  def makeDTree(l, r, p, axis)
    unless l < r
      return nil
    end

    mid = (l + r) / 2
    t = @np
    @np += 1

    new_p = p[l...r].sort_by{ |p| p[axis] }
    # puts "l: #{l}, r: #{r}, depth: #{depth} px: #{@p.map{|p| p.x}}, py: #{@p.map{|p| p.y}}"
    # puts "l: #{l}, r: #{r}, mid: #{mid}, new_p: #{new_p}"
    node = new_p[mid - l]
    @t[t] = node
    axis ^= 1
    @t[t][3] = makeDTree(0, mid - l, new_p, axis)
    @t[t][4] = makeDTree(mid+1 - l, r - l, new_p, axis)

    return t
  end

  def find(v, sx, tx, sy, ty, ans, axis)
    x = @t[v][0]
    y = @t[v][1]

    if sx <= x && x <= tx && sy <= y && y <= ty
      ans << @t[v][2]
    end

    if axis.zero?
      axis ^= 1
      if @t[v][3] && sx <= x
        find(@t[v][3], sx, tx, sy, ty, ans, axis)
      end
      if @t[v][4] && x <= tx
        find(@t[v][4], sx, tx, sy, ty, ans, axis)
      end
    else
      axis ^= 1
      if @t[v][3] && sy <= y
        find(@t[v][3], sx, tx, sy, ty, ans, axis)
      end
      if @t[v][4] && y <= ty
        find(@t[v][4], sx, tx, sy, ty, ans, axis)
      end
    end
  end
end

# MyNode is too late.
# class MyNode
#   attr_accessor :x, :y, :id, :l, :r
#   def initialize(id:, x:, y:)
#     @id = id
#     @x = x
#     @y = y
#     @l = nil
#     @r = nil
#   end
# end

# start_time = Time.now
n = gets.to_i
p = Array.new
n.times do |i|
  x, y = gets.split.map(&:to_i)
  p << [x, y, i]
end
# p "Initialze #{Time.now - start_time}s"

d_tree = DTree.new(p, n)
# p "Make tree #{Time.now - start_time}s"

q = gets.to_i
q.times do
  ans = []
  sx, tx, sy, ty = gets.split.map(&:to_i)
  d_tree.find(0, sx, tx, sy, ty, ans, 0)
  ans.sort!
  ans.each do |id|
    puts id
  end
  puts
end
# p "End #{Time.now - start_time}s"
