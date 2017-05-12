# each
hash = { a: 1, b: 2, c: 3 }

hash.each do |key, value|
  puts "The key is #{key} and the value is #{value}"
end
# note the return value is the original array

# map
[1, 2, 3].map do |num|
  num * 2
end

[1, 2, 3].map do |num|
  num.odd?
  puts num
end
# return value is [nil, nil, nil]