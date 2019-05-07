class Card
  attr_reader :suit, :value
  def initialize(card_str)
    @suit = card_str[0]
    @value = card_str[1..-1].to_i
  end

  def to_s
    @suit + @value.to_s
  end

  def ==(other)
    if other.is_a?(Card)
      suit == other.suit && value == other.value
    else
      false
    end
  end
end

def bubble_sort!(arr)
  n = arr.length
  for i in 0..(n-1)
    for j in (n-1).downto(i+1)
      if arr[j].value < arr[j-1].value
        arr[j], arr[j-1] = arr[j-1], arr[j]
      end
    end
  end
  return arr
end

def selection_sort!(arr)
  n = arr.length
  for i in 0...n
    minj = i
    for j in i...n
      if arr[j].value < arr[minj].value
        minj = j
      end
    end
    if i != minj
      arr[i], arr[minj] = arr[minj], arr[i]
    end
  end
  return arr
end

def is_stable?(input, out)
  n = input.length
  for i in 0...n
    for j in (i+1)...n
      for a in 0...n
        for b in (a+1)...n
          if input[i].value == input[j].value && input[i] == out[b] && input[j] == out[a]
            return false
          end
        end
      end
    end
  end
  true
end

def print_is_stable(input, out)
  if is_stable?(input, out)
    puts 'Stable'
  else
    puts 'Not stable'
  end
end

n = gets().to_i
arr = gets().split.map{ |card_str| Card.new(card_str)} 

input_arr = arr.map(&:clone)
bubble_sort!(arr)
puts arr.join(' ')
print_is_stable(input_arr, arr)
arr = input_arr
input_arr = arr.map(&:clone)
selection_sort!(arr)
puts arr.join(' ')
print_is_stable(input_arr, arr)
