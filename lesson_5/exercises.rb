# ex 1
# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

new_arry = arr.sort do |a,b|
  b.to_i <=> a.to_i
end
p new_arry

# Exercise 2

# How would you order this array of hashes based on the year of publication of 
# each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books_by_year = books.sort_by do |hsh|
  hsh[:published].to_i # don't need to_i since all the years are 4 char strings
end
p books_by_year

# Exercise 3

# For each of these collection objects demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
puts arr1[2][1][3]
arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
puts arr2[1][:third][0]
arr3 = [['abc'], ['def'], {third: ['ghi']}]
puts arr3[2][:third][0][0]
hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
puts hsh1['b'][1]
hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
puts hsh2[:third].key(0)
=begin
Note: the Hash#key method returns the key of an occurrence of a given value. 
A couple of things to note when using this method:

If more than one key has the same value the method returns the key for the first 
occurrence of that value.
If the requested value does not exist in the hash then nil is returned.
For this example you could also have done the following:

hsh2[:third].keys[0] # => 'g'
Although this looks very similar to the initial solution, Hash#key and 
Hash#keys are actually two completely different methods. Hash#key returns a 
single key based on a value passed to the method. Hash#keys returns an array of 
all the keys in the hash, and the [0] is then referencing the object at index
0 of that returned array.
=end

# exercise 4

# For each of these collection objects where the value 3 occurs, demonstrate how 
# you would change this to 4.

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2] = [4]
# this is not quite right. according to Pete H. : The difference between the
# two is that the LS solution changes the element from a value of 3 to a value
# of 4, while yours replaces the entire subarray. The object id changes in my
# solution whereas the object id of the 

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4

# LS solution:
arr1[1][1] = 4
arr1 # => [1, [2, 4], 4]

arr2[2] = 4
arr2 # => [{:a=>1}, {:b=>2, :c=>[7, 6, 5], :d=>4}, 4]

hsh1[:first][2][0] = 4
hsh1 # => {:first=>[1, 2, [4]]}

hsh2[['a']][:a][2] = 4
hsh2 # => {["a"]=>{:a=>["1", :two, 4], :b=>4}, "b"=>5}
# note that: the key for the first item in the outer hash is actually an array 
# containing a single string object ["a"]
# 
# Exercise 5
# What is the total age of the male members of the family?
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
total = 0
munsters.each do | key, values |
  if values["gender"] == "male"
    total += values["age"]
  end
end
puts total.to_s
# ls solution:
total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

total_male_age # => 444

# Exercise 6
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# Given this previously seen family hash, print out the name, age and gender of each family member
munsters.each do |key, value|
  puts "#{key} is a #{value['age']}-year-old #{value['gender']}."
end
# ls solution:
munsters.each_pair do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end

# Exercise 7 
# Given this code, what would be the final values of a and b? Try to work this 
# out without running the code.
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a
# a => 4 
# b => 5 - 4 = 1 so [1, 8] WRONG!
# ls solution
a # => 2 a not referenced, so only arr changes not a
b # => [3, 8] b is changed because b is an array and we're assigning a new
# value to it at index 0
p arr # => [4, [3, 8]]

# Exercise 8
# Using the each method, write some code to output all of the vowels from the strings.
vowels = 'aeiou'
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, values|
  values.each do |letter|
    letter.chars do |s|
      puts s if vowels.include? s
    end
  end
end
# ls solution:
vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end

# exercise 9
# Given this data structure, return a new array of the same structure but with 
# the sub arrays being ordered (alphabetically or numerically as appropriate) in 
# descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

new_arr = arr.map do |sub_arr|
  sub_arr.sort do |el_a, el_b|
    el_b <=> el_a
  end
end
p new_arr

# Exercise 10

# Given the following data structure and without modifying the original array, 
# use the map method to return a new array identical in structure to the original 
# but where the value of each integer is incremented by 1.

array1 = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
array2 = array1.map do |curr_hash|
  new_hash = {}
  curr_hash.each do |k,v|
    new_hash[k] = v + 1
  end
  new_hash
end
p array2
# LS alternate soln:
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  arr << incremented_hash
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]

# Exercise 11

# Given the following data structure use a combination of methods, including 
# either the select or reject method, to return a new array identical in structure 
# to the original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
new_array = arr.map do |sub|
  sub.select do |e1|
    e1 % 3 == 0
  end
end
p new_array

# alternate using reject:
arr.map do |element|
  element.reject do |num|
    num % 3 != 0
  end
end
# => [[], [3], [9], [15]]
# note using select with == is more readable

# Exercise 12

# Given the following data structure, and without using the Array#to_h method,
# write some code that will return a hash where the key is the first item in each 
# sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
new_hash = arr.map do |element|
  new_hash = {}
  puts "element " +  element.to_s
  new_hash[element[0]] = element[1]
  new_hash
end
p new_hash # [{:a=>1}, {"b"=>"two"}, {"sea"=>{:c=>3}}, {{:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}]
# this is not correct because the requirements state that  a hash is returned
# with key-value pairs based on first and second elements in original sub-arrays
# ls solution
hsh = {}
arr.each do |item|
  hsh[item[0]] = item[1]
end
# => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
#
# Exercise 13
# Given the following data structure, return a new array containing the same 
# sub-arrays as the original but ordered logically according to the numeric value 
# of the odd integers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
# The sorted array should look like this:

# [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
sorted = arr.sort_by do |sub|
  sub.select do |num|
    num.odd?
  end
end 
p sorted # nope doesn't work
# ls soln
arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end
# => [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# Exercise 14

# Given this data structure write some code to return an array containing the 
# colors of the fruits and the sizes of the vegetables. The sizes should be
# uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
# The return value should look like this:
# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

new_hash =  hsh.map do |_,v|
  if v[:type] == 'fruit'
    v[:colors].map do |color| # need to iterate through the array to get the colors
       color.capitalize
     end
  elsif v[:type] == 'vegetable'
    v[:size].upcase
  end
end

p new_hash

# Exercise 15

# Given this data structure write some code to return an array which contains
# only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

even_vals = arr.select do |hsh3|
  hsh3.all? do |k,v|
    v.all? do |num|
      num.even?
    end
  end
end
p even_vals
# ls solution
=begin
arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end
# => [{:e=>[8], :f=>[6, 10]}]
=end
#
# ex 16
# Write a method that returns one UUID when called with no parameters.
# Each UUID consists of 32 hexadecimal characters, and is typically broken into
# 5 sections like this 8-4-4-4-12 and represented as a string.
# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

def new_uuid
  5.times do |segment|
    random_string = Random.new.bytes(10)
    hex_segment = random_string.unpack('H*')
    #p hex_segment
    return hex_segment
  end
end
p new_uuid
