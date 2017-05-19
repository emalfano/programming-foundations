# Combining all the concepts from Advanced Collections:
# Example 1

[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]
# This is looping through each element of the array and printing the first
# element of the inner arrays. Each inner array passed to the block and is 
# being assigned to arr. Array#first is called on arr which returns the 
# object at index 0. The value of the block is nil but nothing is done with 
# that. The return value of each is the calling object (the nexted array).

# Example 2

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]
# line 1
# action: method call map
# object: outer array
# side effect: none
# Return value: new array [nil, nil]
# Is return value used? no, shown on line 6
# line 1-3
# action: block execution
# object: each sub-array
# side effect: none
# Return value: nil
# Is return value used? yes, used by map for transformation
# line 2 
# action: method call first
# object: inner array
# side effect: none
# Return value: element at index 0 of sub-array
# Is return value used? yes, used by puts
# line 2
# action: method call puts
# object: each element at index 0 of each sub-array
# side effect: outputs the integer
# Return value: nil
# Is return value used? yes, used to determine return value of block

# example 3
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# line 1
# action: method call map
# object: outer array
# side effect: none
# return value: new array [1, 3] * note this is different from previous * 
# is return value used? no
# line 1-4
# action: block execution
# object: each sub-array
# side effect: none
# return value: integer at index 0 of sub-array
# is return value used? yes, used by map for transformation
# line 2
# action: method call first
# object: each sub-array
# side effect: none
# return value: returns the element at index 0 of each sub-array
# is return value used? used by puts
# line 2
# action: method call puts
# object: first element of each sub-array
# side effect: outputs the integer
# return value: nil
# is return value used? no
# line 3
# action: method call first
# object: each sub-array
# side effect: none
# return value: the element at index 0 of each sub-array
# is return value used? yes, used to determine the return value of block
# example 4
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
# multiple return values and multiple side effects  
# line 1
# action: variable assignment
# object: n/a
# side effect: none
# return value: original array
# is return value used? no
# line 1
# action: method call each
# object: outer array [[18, 7], [3, 12]]
# side effect: none
# return value: calling object
# is return value used? yes used by variable my_arr
# line 1-7
# action: outer block execution
# object: each sub-array
# side effect: none
# return value: each sub-array
# is return value used? no
# line 2
# action: method call each
# object: each element of the sub-array in that iteration of outer block
# side effect: non
# return value: calling object which is the sub-array in current iteration
# is return value used? yes, used to determine return value of outer block
# line 2-6
# action: inner block execution
# object: element of sub-array in that iteration
# side effect: none
# return value: nil
# is return value used? no
# line 3
# action: conditional (if)
# object: element of sub-array in that iteration
# side effect: none
# return value: nil
# is return value used? yes,used to determine return value of inner block
# line 4
# action: method call puts
# object: element of the sub-array in that iteration
# side effect: outputs a string
# return value: nil
# is return value used? yes, used to determine the retur value of the inner block
# what is the output and what is the value of my_arr?
# 18
# 7
# 12
# my_arr = [[18, 7], [3, 12]]
# remember each ignores the block's return value
# 
# example 5
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# => [[2, 4], [6, 8]]
# line 1
# action: method call map
# object: original array
# side effect: none
# return value: new transformed array [[2, 4], [6, 8]]
# is return value used? no
# line 1-5
# action: outer block execution
# object: each sub-array
# side effect: none
# return value: each sub-array
# is return value used? yes, used by top-level map for transformation
# line 2
# action: method call map
# object: each sub-array
# side effect: none
# return value: new transformed array
# us return value used? yes, used to determine outer block's return value
# line 2-4
# action: inner block execution
# object: each element of sub-array
# side effect: none
# return value: an integer
# is return value used? yes, used by inner map for transformation
# line 3
# action: num * 2
# object: n/a
# side effect: none
# return value: an integer
# is return value used? yes, used to determine inner block's return value
#
# example 6
# 
new_arr = [{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
p new_arr
# => [{ :c => "cat" }]

=begin
The first thing to notice here is the use of the all? method within the select 
block. Since #select specifically cares about the truthiness of the block's
return value, using a method that returns a boolean works well. all? will return
true if the block passed to it never returns a value of false or nil for every 
key/value pair in the hash. We're using value[0] == key.to_s to test whether all 
keys match the first letter of all their associated values. Note that the only 
hash that meets this criteria is {:c => 'cat'}, and the return value is an array.

What would happen if, instead of using all?, we used any?. Why would this affect 
the return value of select?
=end
# if we used any?, it would return both sub-arrays because it's only checking to
# see if one of the key-value pairs in the element returns true in other words
# The method returns true if the block ever returns a value other than false or nil

# Example 7
# 
# we want to sort this array in numerical order
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
p arr.sort
# doesn't give us a numerical comparison, need to do  a transformation
arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]
# each time the top level block is called, map is called on the sub-array
# for that iteration. Within the block we call to_i on ensach string in the 
# sub-array, which returns a new array. The outer array is sorted by 
# comparing the transformed integers in the inner array. No side effects.

# example 8
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ["apple"]]

# map is used to return a new array with selected values. if each was used 
# here you would need an extra variable to collect the results

# example 9
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end

# line 1 calls map on outer array returning original array
# need to understand this one better

# ex 10
new_array = [[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
p new_array
# => [[[2, 3], [4, 5]], [6, 7]]




