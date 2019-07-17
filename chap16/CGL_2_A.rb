class Point
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def -(p)
    Point.new(x - p.x, y - p.y)
  end
end

def dot(a, b)
  a.x * b.x + a.y * b.y
end

def cross(a, b)
  a.x * b.y - a.y * b.x
end

Segment = Struct.new('Segment', :p1, :p2)

def is_orthogonal?(s1, s2)
  dot(s1.p2 - s1.p1, s2.p2 - s2.p1).zero?
end

def is_parallel?(s1, s2)
  cross(s1.p2 - s1.p1, s2.p2 - s2.p1).zero?
end

n = gets.to_i
n.times do
  x0, y0, x1, y1, x2, y2, x3, y3 = gets.split.map(&:to_i)
  p0 = Point.new(x0, y0)
  p1 = Point.new(x1, y1)
  p2 = Point.new(x2, y2)
  p3 = Point.new(x3, y3)
  s1 = Segment.new(p0, p1)
  s2 = Segment.new(p2, p3)
  if is_orthogonal?(s1, s2)
    puts 1
  elsif is_parallel?(s1, s2)
    puts 2
  else
    puts 0
  end
end