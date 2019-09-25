require 'minitest/autorun'

def main
  puts 'wright n, m, k'
  input = gets.chomp.split(' ').map(&:to_i)
  puts set_ones_in_positions(input[0], input[1], input[2])
end

def set_ones_in_positions(n, k, m)
  m, k = k, m if k > m

  temp = 1 << (m - k)
  temp += 1 if m != k # in case, when m == k, we don't want to add 1
  temp = temp << k

  n = n | temp
end

main

class Test < Minitest::Test
  def test_normal
    assert_equal 63, set_ones_in_positions(43, 4, 2)
  end

  def test_swapped
    assert_equal 63, set_ones_in_positions(43, 2, 4)
  end

  def test_equal
    assert_equal 3, set_ones_in_positions(2, 0, 0)
  end
end