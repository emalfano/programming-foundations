# Methods and more methods
# Exercise 1

# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end
# LS solution
# => [1, 2, 3]
# select performs selection based on the truthiness of the block's return value.
# In this case the return value will always be 'hi', which is a "truthy" value.
# Therefore select will return a new array containing all of the elements in the
# original array.

# Exercise 2

# How does count treat the block's return value? How can we find out?

puts ['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# => 2
# Array#count docs say: If a block is given, counts the number of elements for
# which the block returns a true value.

# Exercise 3
# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# => [1, 2, 3]
# in this case I expected an empty array because nothing should be rejected, 
# but in actuality everything is rejected? Because puts always returns nil. 
# Because the blocks returns falsey for every element, it returns all the elements

# Exercise 4
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
# => { "a" => "ant", "b" => "bear", "c" => "cat" }
# returns a hash because that was the initially given object. The object was
# modified in the block to return 3 key-value pairs

# Exercise 5

# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
p hash.shift
# => [:a, "ant"]
# According to docs, Removes a key-value pair from hsh and returns it as the
# two-item array [ key, value ], or the hash’s default value if the hash is empty.

# Exercise 6

['ant', 'bear', 'caterpillar'].pop.size
# => 11 returns the size of the last element of the array

# Exercise 7

# What is the block's return value in the following code? 
# ema: true
# How is it determined? 
# num.odd? is called on each element
#Also, what is the return value of any? in this code. 
# true
# What gets output by this code?
# 1 2 3 # actually any? stops after first iteration because there is no need
# to go further

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

=begin
The return value of the block is determined by the return value of the last
expression within the block. In this case the last statement evaluated is num.odd?, 
which returns a boolean. Therefore the block's return value will be a boolean, 
since Fixnum#odd? can only return true or false.

Since the Array#any? method returns true if the block ever returns a value other 
than false or nil, and the block returns true on the first iteration, we know 
that any? will return true. What is also interesting here is any? stops iterating
after this point since there is no need to evaluate the remaining items in the
array; therefore, puts num is only ever invoked for the first item in the array: 1.
=end
# Exercise 8 

arr = [1, 2, 3, 4, 5]
arr.take(2)

# how does take work?
# returns the first 2 elements as an array
# It is not destructive. We can run in irb to find out
# if you don't know how something works, read the docs!

# Exercise 9
# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# => ['bear'] returns an array with the elements that have a value size 
# greater than 3
# LS: returns [nil, "bear"] evaluates both elements and returns nil for the 
# first because it evaluates to false and value won't be returned

# Exercise 10

# What is the block's return value in the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
# =>  [1, nil, nil] because the block returns nil for puts

# Additional practice exercises:
# Q1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the values are the positions in the array.
hsh = {}
flintstones.each_with_index do | name, idx |
  hsh[idx] = name
end

p hsh

# Exercise 2

# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total_ages = 0
ages.each do | key, value  |
  total_ages += value
end
puts total_ages


# ls solution: 
total_ages = 0
ages.each { |_,age| total_ages += age }
puts total_ages # => 6174

# another method, this is an Enumerable method. Study enumerable class to 
# increase knowledge of available methods
ages.values.inject(:+) # => 6174

# Exercise 3

# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# throw out the really old people (age 100 or older).
new_ages = ages.reject { | _name, age | age >= 100 }
puts new_ages

# LS soln
ages.keep_if { |_, age| age < 100 }
puts ages
# note that select! can also be used here but pay attn to differences

# pick out minimum age in this hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
puts ages.values.min

# Exercise 5

# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"

flintstones.each_with_index do |name, index| 
  if name.start_with?("Be") 
    puts "#{name} #{index}"
  end
end

# LS solution
flintstones.index { |name| name[0, 2] == "Be" }

# Exercise 6

# Amend this array so that the names are all shortened to just 
# the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! do |name|
  name = name.slice(0..2)
end
p flintstones
# ls soln
flintstones.map! do |name|
  name[0, 3]
end
# or 
flintstones.map! { |name| name[0,3] }

# Exercise 7

# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"
# ex:

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

hsh = {}
statement.chars do |letter|
  if hsh.has_key?(letter)
    hsh[letter] += 1
  else
    hsh[letter] = 1
  end
end
p hsh
# ls soln
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

# ex 8
# what happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
# 1 3  the first element on each iteration would be deleted
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# 1 2
# note that each works on the array in real time not a copy

# ex 9 create a method that changes string to title case
def titleize(str)
  words = str.split
  words.map! { |word| word.capitalize }
  str = words.join(" ")
end
p titleize("The Flintstones Rock")