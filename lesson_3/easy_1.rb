# q1
# I expect the code to print [1, 2, 2, 3] because #uniq doesn't mutate the obj
# it will print in the puts format 1 2 2 3 on separate lines
numbers = [1, 2, 2, 3]
numbers.uniq # returns the unique elements but does not modify numbers

puts numbers      # prints 1 2 2 3 on separate lines
puts numbers.inspect # [1, 2, 2, 3]
p numbers         # [1, 2, 2, 3]

# q2
=begin
Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:
  ! is used for some methods that mutate the caller
  ? is used when a method returns true or false
  ^^ both depend on the implementation, not a given
  used at the end of the method name, not Ruby syntax

    what is != and where should you use it?
      Not equals,  when you want to check a condition for something not equal to
      something else
    put ! before something, like !user_name
      When you want to check for the opposite of a value, 
      turns the object into opposite of its boolean equivalent
    put ! after something, like words.uniq!
      Signifies that .uniq! mutates the caller
    put ? before something
      ? : the ternary operator for if...else
    put ? after something
      For a method that returns true or false
    put !! before something, like !!user_name
      Not not is the same as user_name, turns the object into opposite of 
      its boolean equivalent
=end
# q3
# replace the word emergency with the work urgent
advice = "Few things in life are as important as house training your pet 
dinosaur."

words = advice.split(' ')
words[6] = 'urgent'
advice = words.join(' ')
puts advice

# LS soln
advice.gsub!('important', 'urgent')
puts advice

# Q 4
numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1) # deletes element at index 1
p numbers

numbers = [1, 2, 1, 3, 4, 5]
numbers.delete(1)    # deletes the number 1
p numbers

#Question 5

# Programmatically determine if 42 lies between 10 and 100.
# use ruby's range object
puts (10..100).include?(42)   #=> true
# LS soln
puts (10..100).cover?(42)     # true

# Q 6
famous_words = "seven years ago..."
# find two ways to put "four score and " in front of it
famous_words.insert(0, 'Four score and ')
puts famous_words

famous_words = "seven years ago..."
puts "Four score and " + famous_words

famous_words = "seven years ago..."
famous_words.prepend('Four score and ')
puts famous_words

# Q 7
# gsub!
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
# "add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"
eval how_deep # shouldn't this give an error? my guess is 42

# Q 8
# make this into an unnested array
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten!
p flintstones

# Q 9
# Turn this into an array containing only two elements: Barney's name and Barney's number 
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, 
                "BamBam" => 4, "Pebbles" => 5 }
puts flintstones["Barney"]

array = ["Barney", flintstones["Barney"]]
p array
# LS soln
p flintstones.assoc("Barney")
