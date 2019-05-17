def reconstruction(l, r)
  if l >= r
    return
  end
  c = $preorders.shift
  m = $inorders.index(c)

  reconstruction(l, m)
  reconstruction(m + 1, r)

  $postorders << c
end

n = gets.to_i
$preorders = gets.split.map(&:to_i)
$inorders = gets.split.map(&:to_i)
$postorders = []

reconstruction(0, n)

puts $postorders.join(" ")