class Point
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def -(p)
    Point.new(x - p.x, y - p.y)
  end

  def norm
    @x * @x + @y * @y
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

def ccw(p0, p1, p2)
  a = p1 - p0
  b = p2 - p0
  return "COUNTER_CLOCKWISE" if cross(a, b) > 0
  return "CLOCKWISE" if cross(a, b) < 0
  return "ONLINE_BACK" if dot(a, b) < 0
  return "ONLINE_FRONT" if a.norm < b.norm
  return "ON_SEGMENT"
end

x0, y0, x1, y1 = gets.split.map(&:to_i)
p0 = Point.new(x0, y0)
p1 = Point.new(x1, y1)
n = gets.to_i
n.times do
  x2, y2 = gets.split.map(&:to_i)
  p2 = Point.new(x2, y2)
  puts ccw(p0, p1, p2)
end
