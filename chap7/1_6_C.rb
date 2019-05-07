class Card
  attr_reader :suit
  attr_accessor :value
  def initialize(card_str)
    @suit = card_str[0]
    @value = card_str[1..-1].to_i
  end

  def to_s
    @suit + ' ' + @value.to_s
  end

  def ==(other)
    if other.is_a?(Card)
      suit == other.suit && value == other.value
    else
      false
    end
  end
end

def is_stable?(input, out)
  input == out
  # n = input.length
  # for i in 0...n
  #   if input[i] != out[i]
  #     return false
  #   end
  # end
  # true
end

def partition(arr, p, r)
  x = arr[r].value
  i = p - 1
  for j in p...r
    if arr[j].value <= x
      i += 1
      arr[i], arr[j] = arr[j], arr[i]
    end
  end
  arr[i + 1], arr[r] = arr[r], arr[i + 1]
  return i + 1
end

def quick_sort(arr, p, r)
  if p < r
    q = partition(arr, p, r)
    quick_sort(arr, p, q-1)
    quick_sort(arr, q+1, r)
  end
end

def merge(arr, left, mid, right)
  n1 = mid - left
  n2 = right - mid
  l = []
  for i in 0...n1
    l << arr[left + i]
  end
  r = []
  for i in 0...n2
    r << arr[mid + i]
  end
  final = Card.new('finale 0')
  final.value = Float::INFINITY
  l << final
  r << final
  i = 0
  j = 0
  for k in left...right
    if l[i].value <= r[j].value
      arr[k] = l[i]
      i += 1
    else
      arr[k] = r[j]
      j += 1
    end
  end
end

def merge_sort(arr, left, right)
  if left + 1 < right
    mid = (left + right) / 2
    merge_sort(arr, left, mid)
    merge_sort(arr, mid, right)
    merge(arr, left, mid, right)
  end
end

n = gets.to_i
cards = []
n.times do
  cards << Card.new(gets)
end


sorted_cards = cards.dup
quick_sort(sorted_cards, 0, n-1)
merge_sort(cards, 0, n)
if is_stable?(cards, sorted_cards)
  puts "Stable"
else
  puts "Not stable"
end

sorted_cards.each do| card|
  puts card
end