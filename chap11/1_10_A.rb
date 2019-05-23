def fibonacci(n)
  if n.zero? || n == 1
    return $F[n] = 1
  end
  if $F[n]
    return $F[n]
  end
  return $F[n] = fibonacci(n - 2) + fibonacci(n - 1)
end

$F = Array.new(50, nil)
n = gets.to_i
puts fibonacci(n)