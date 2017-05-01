# Question 1
# What do you expect to happen when the greeting variable is referenced in the 
# last line of the code below?

if false
  greeting = “hello world”
end

greeting
# this never gets defined so I would expect an error or nothing
# LS answer greeting is nil, the variable is initialized to nil because it's
# it's initialized in the if block even if the if block doesn't get executed,
# so no exception is thrown

# Question 2
# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
# this should print out { a: 'hi there'} because the reference to the hash object is
# pointing to the same address as informal_greeting. String#<< mutates the 
# caller. If we don't want to modify the greetings variable we can do one of 
# these techniques:
# initialize informal_greeting with a reference to a new object containing the 
# same value by informal_greeting = greetings[:a].clone.
# we can use string concatenation, informal_greeting = informal_greeting + ' there',
# which returns a new String object instead of modifying the original object.

# Question 3
# In other exercises we have looked at how the scope of variables affects the 
# modification of one "layer" when they are passed to another.

# To drive home the salient aspects of variable scope and modification of one 
# scope by another, consider the following similar sets of code.

# What will be printed by each of these code groups?

# A)

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
# B)

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
# C)

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"


# Question 4


