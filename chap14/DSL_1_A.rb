class DisjointSets

  def initialize(n)
    @p = Array.new(n)
    @rank = Array.new(n)
    n.times do |i|
      make_set(i)
    end
  end

  def make_set(x)
    @p[x] = x
    @rank[x] = 0
  end

  def same?(x, y)
    find_set(x) == find_set(y)
  end

  def find_set(x) 
    if x != @p[x]
      @p[x] = find_set(@p[x])
    end
    @p[x]
  end

  def unite(x, y)
    link(find_set(x), find_set(y))
  end

  def link(x, y) 
    if @rank[x] > @rank[y]
      @p[y] = x
    else
      @p[x] = y
      if (@rank[x] == @rank[y])
        @rank[y] += 1
      end
    end
  end
end

n, q = gets.split.map(&:to_i)
ds = DisjointSets.new(n)
q.times do
  com, x, y = gets.split.map(&:to_i)
  case com
  when 0
    ds.unite(x, y)
  when 1
    puts ds.same?(x, y) ? 1 : 0
  end
end

