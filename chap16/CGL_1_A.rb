class Point
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def +(p)
    Point.new(@x + p.x, @y + p.y)
  end

  def -(p)
    Point.new(@x - p.x, @y - p.y)
  end

  def *(k)
    Point.new(@x * k, @y * k)
  end

  def to_s
    "#{@x} #{@y}"
  end
end

def dot(a, b)
  a.x * b.x + a.y * b.y
end

def cross(a, b)
  a.x * b.y - a.y * b.x
end

def norm(a)
  a.x * a.x + a.y * a.y
end

Segment = Struct.new('Segment', :p1, :p2)

def project(s, p)
  base = s.p2 - s.p1
  r = dot(p - s.p1, base).to_f / norm(base)
  s.p1 + base * r
end

x0, y0, x1, y1 = gets.split.map(&:to_i)
p0 = Point.new(x0, y0)
p1 = Point.new(x1, y1)
base = Segment.new(p0, p1)

n = gets.to_i
n.times do
  x, y = gets.split.map(&:to_i)
  p = Point.new(x, y)
  puts project(base, p).to_s
end