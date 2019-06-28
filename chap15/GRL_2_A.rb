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
      if @rank[x] == @rank[y]
        @rank[y] += 1
      end
    end
  end
end

def kruskal(n, edges)
  edges.sort!
  total_cost = 0
  s = DisjointSets.new(n)
  edges.each do |edge|
    unless s.same?(edge.source, edge.target)
      s.unite(edge.source, edge.target)
      total_cost += edge.weight
    end
  end
  total_cost
end


class Edge
  attr_accessor :source, :target, :weight
  def initialize(source:, target:, weight:)
    @source = source
    @target = target
    @weight = weight
  end

  def <=>(other)
    @weight - other.weight
  end
end

v, e = gets.split.map(&:to_i)
edges = []
e.times do
  s, t, w = gets.split.map(&:to_i)
  edges << Edge.new(source: s, target: t, weight: w)
end

puts kruskal(v, edges)