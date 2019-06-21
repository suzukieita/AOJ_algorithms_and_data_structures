class DTree
  def initialize(p)
    @p = p
    n = @p.size
    @t = Array.new(n) { MyNode.new }
    @np = 0
    @sum = 0
    makeDTree(0, n, 0)
  end

  def makeDTree(l, r, depth)
    unless l < r
      return nil
    end

    mid = (l + r) / 2
    t = @np
    @np += 1

    
    if depth % 2 == 0
      @p[l...r] = @p[l...r].sort_by{ |p| p.x }
    else
      @p[l...r] = @p[l...r].sort_by{ |p| p.y }
    end
    # puts "l: #{l}, r: #{r}, depth: #{depth} px: #{@p.map{|p| p.x}}, py: #{@p.map{|p| p.y}}"

    @t[t].location = mid
    @t[t].l = makeDTree(l, mid, depth + 1)
    @t[t].r = makeDTree(mid+1, r, depth + 1)

    return t
  end

  def find(v, sx, tx, sy, ty, depth, ans)
    x = @p[@t[v].location].x
    y = @p[@t[v].location].y

    if sx <= x && x <= tx && sy <= y && y <= ty
      ans << @p[@t[v].location].id
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

class MyPoint
  attr_accessor :x, :y, :id
  def initialize(id:, x:, y:)
    @id = id
    @x = x
    @y = y
  end
end

class MyNode
  attr_accessor :location, :l, :r
  def initialize
    @location = nil
    @l = nil
    @r = nil
  end
end


n = gets.to_i
p = Array.new(n)
n.times do |i|
  x, y = gets.split.map(&:to_i)
  p[i] = MyPoint.new(id:i, x:x, y:y)
end
d_tree = DTree.new(p)
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