ary = [2, 5, 3, 4, 1]
ary.sort! do |a, b|
  a <=> b
end
# => [1, 2, 3, 4, 5]
p ary