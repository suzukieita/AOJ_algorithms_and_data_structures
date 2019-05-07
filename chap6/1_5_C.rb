def koch(d, p1, p2)
  return if d.zero?

  s = calc_s(p1, p2)
  t = calc_t(p1, p2)
  u = calc_u(s, t)

  koch(d - 1, p1, s)
  puts s
  koch(d - 1, s, u)
  puts u
  koch(d - 1, u, t)
  puts t
  koch(d - 1, t, p2)
end

def calc_s(p1, p2)
  x = (2 * p1.x + 1 * p2.x) / 3
  y = (2 * p1.y + 1 * p2.y) / 3
  Point.new(x, y)
end

def calc_u(s, t)
  radian_60 = 60 * Math::PI / 180
  x = (t.x - s.x) * Math.cos(radian_60) - (t.y - s.y) * Math.sin(radian_60) + s.x
  y = (t.x - s.x) * Math.sin(radian_60) + (t.y - s.y) * Math.cos(radian_60) + s.y
  Point.new(x, y)
end

def calc_t(p1, p2)
  x = (1 * p1.x + 2 * p2.x) / 3
  y = (1 * p1.y + 2 * p2.y) / 3
  Point.new(x, y)
end

Point = Struct.new(:x, :y) do
  def to_s
    format('%10.8f %10.8f', x, y)
  end
end

n = gets.to_i
p1 = Point.new(0.0, 0.0)
p2 = Point.new(100.0, 0.0)
puts p1
koch(n, p1, p2)
puts p2