class DTree
  def initialize(p)
    # @p = p
    n = p.size
    @t = Array.new(n)
    @np = 0
    @sum = 0
    makeDTree(0, n, 0, p)
  end

  def makeDTree(l, r, depth, p)
    unless l < r
      return nil
    end

    mid = (l + r) / 2
    t = @np
    @np += 1

    
    if depth % 2 == 0
      new_p = p[l...r].sort_by{ |p| p.x }
    else
      new_p = p[l...r].sort_by{ |p| p.y }
    end
    # puts "l: #{l}, r: #{r}, depth: #{depth} px: #{@p.map{|p| p.x}}, py: #{@p.map{|p| p.y}}"
    # puts "l: #{l}, r: #{r}, mid: #{mid}, new_p: #{new_p}"
    node = new_p[mid - l]
    @t[t] = node
    @t[t].l = makeDTree(0, mid - l, depth + 1, new_p)
    @t[t].r = makeDTree(mid+1 - l, r - l, depth + 1, new_p)

    return t
  end

  def find(v, sx, tx, sy, ty, depth, ans)
    x = @t[v].x
    y = @t[v].y

    if sx <= x && x <= tx && sy <= y && y <= ty
      ans << @t[v].id
    end

    if depth % 2 == 0
      if @t[v].l && sx <= x
        find(@t[v].l, sx, tx, sy, ty, depth + 1, ans)
      end
      if @t[v].r && x <= tx
        find(@t[v].r, sx, tx, sy, ty, depth + 1, ans)
      end
    else
      if @t[v].l && sy <= y
        find(@t[v].l, sx, tx, sy, ty, depth + 1, ans)
      end
      if @t[v].r && y <= ty
        find(@t[v].r, sx, tx, sy, ty, depth + 1, ans)
      end
    end
  end
end

class MyNode
  attr_accessor :x, :y, :id, :location, :l, :r
  def initialize(id:, x:, y:)
    @id = id
    @x = x
    @y = y
    @location = nil
    @l = nil
    @r = nil
  end
end

start_time = Time.now
n = gets.to_i
p = Array.new(n)
n.times do |i|
  x, y = gets.split.map(&:to_i)
  p[i] = MyNode.new(id:i, x:x, y:y)
end
# p "Initialze #{Time.now - start_time}s"

d_tree = DTree.new(p)
# p "Make tree #{Time.now - start_time}s"

q = gets.to_i
q.times do
  ans = []
  sx, tx, sy, ty = gets.split.map(&:to_i)
  d_tree.find(0, sx, tx, sy, ty, 0, ans)
  ans.sort!
  ans.each do |id|
    puts id
  end
  puts ''
end
# p "End #{Time.now - start_time}s"
