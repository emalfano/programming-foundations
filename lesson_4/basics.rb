# Conversion
str = 'How do you get to Carnegie Hall?'
arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
arr.join        # => "HowdoyougettoCarnegieHall?"

# Can you think of a couple of ways in which the items in the array could be
# joined together so that result resembles the original string?

puts arr.join(' ')
puts arr[0] + ' ' + arr[1] + ' ' + arr[2] + ' ' + arr[3] + ' ' + arr[4] + ' ' +
arr[5] + ' ' + arr[6]

arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]
# should return { :name=>'Joe', :age=>10, :favorite_color=>'blue' }
puts arr.to_h

# change the rest of the words to uppercase
str = "joe's favorite color is blue"
str[0] = 'J'
str # => "Joe's favorite color is blue"
str[6] = "F"
str[15] = "C"
str[21] = "I"
str[24] = "B"
puts str
# array element assignment
arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr         # => [2, 2, 3, 4, 5]
# add one to remaining elements
arr[1] += 1 
arr[2] += 1 
arr[3] += 1 
arr[4] += 1 

p arr

# assign the rest of the hash values to either 'Fruit' or 'Vegetable'
hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh[:carrot] = 'Vegetable'
hsh[:pear] = 'Fruit'
hsh[:broccoli] = 'Vegetable'
puts hsh

# Looping

loop do
  number = rand(1..10)   # a random number between 1 and 10
  puts 'Hello!'
  if number == 5
    puts 'Exiting...'
    break
  end
end

# Iteration
# this loop mimics a do/while loop, code is guaranteed to execute at least
# once
counter = 0

loop do
  puts "Hello! counter: #{counter}"
  counter += 1
  break if counter == 5
end

# this code below mimics a while loop
# code may or may not be executed
counter = 0

loop do
  break if counter == 0
  puts 'Hello!'
  counter += 1
end

# Next
counter = 0

loop do
  counter += 1
  next if counter.odd?
  puts counter
  break if counter > 5
end

# Iterating over collections - String
alphabet = 'abcdefghijklmnopqrstuvwxyz'
counter = 0

loop do
  break if counter >= alphabet.size
  puts alphabet[counter]
  counter += 1
end

# Iterating over Arrays
colors = ['green', 'blue', 'purple', 'orange']
counter = 0

loop do
  break if counter == colors.size
  puts "I'm the color #{colors[counter]}!"
  counter += 1
end
# this should output :
# "I'm the color green!"
# "I'm the color blue!"
# "I'm the color purple!"
# "I'm the color orange!"

# Array with different types of objects
objects = ['hello', :key, 10, []]
counter = 0

loop do
  break if counter == objects.size
  puts objects[counter].class
  counter += 1
end

# Hashes
number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}
pets = number_of_pets.keys # => ['dogs', 'cats', 'fish']
counter = 0

loop do
  break if counter == number_of_pets.size
  current_pet = pets[counter]
  current_pet_number = number_of_pets[current_pet]
  puts "I have #{current_pet_number} #{current_pet}!"
  counter += 1
end

# Selection
alphabet = 'abcdefghijklmnopqrstuvwxyz'
selected_chars = ''
counter = 0

loop do
  current_char = alphabet[counter]

  if current_char == 'g'
    selected_chars << current_char    # appends current_char into the selected_chars string
  end

  counter += 1
  break if counter == alphabet.size
end

puts selected_chars # => "g"

# transformation

fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0

loop do
  current_element = fruits[counter]

  transformed_elements << current_element + 's'   # appends transformed string into array

  counter += 1
  break if counter == fruits.size
end

p transformed_elements # => ["apples", "bananas", "pears"]

# implement a select method that selects all key-value pears that have a 
# value of 'Fruit'
def select_fruit(hsh)
  keys = hsh.keys
  counter = 0
  fruits = {}
  
  loop do
    break if counter == keys.size
    current_key = keys[counter]
    current_value = hsh[current_key]
     
    if current_value == 'Fruit'
      fruits[current_key] = current_value   
    end
    
    counter += 1
  end
  
  fruits
end
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# LS soln
def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do
    # this has to be at the top in case produce_list is empty hash
    break if counter == produce_keys.size      

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
# new hash is returned and original argument is not mutated

# transformation code inside of a method definition
# implement a double_numbers! method that mutates its argument
def double_numbers!(numbers)
  # numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    # current_number = numbers[counter]
    # numbers[counter] = current_number * 2
    numbers[counter] *= 2

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers
# lines 7 and 8 can be shortened to 1 line: 
# numbers[counter] = numbers[counter] * 2. This, in turn, can be further condensed to numbers[counter] *= 2.
# the argument my_numbers is permanently modified

# modify this code to double the numbers that have odd indices
def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

# not mutated
my_numbers                      # => [1, 4, 3, 7, 2, 6]

# a general method that takes the selection criteria as an argument
def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do
    break if counter == produce_keys.size      

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    # used to be current_value == 'Fruit'
    if current_value == selection_criteria   
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

general_select(produce, 'Fruit')     # => {"apple"=>"Fruit", "pear"=>"Fruit"}
general_select(produce, 'Vegetable') # => {"carrot"=>"Vegetable", "broccoli"=>"Vegetable"}
general_select(produce, 'Meat')      # => {}

# modify double_numbers method to multiply by any number (transformation criteria)

def multiply(numbers, transformation_criteria)
  new_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    new_numbers << numbers[counter] * transformation_criteria
    # numbers[counter] *= 2

    counter += 1
  end

  new_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]

# the following is a method that takes a string and returns a new string with
# all the letters we specified
def select_letter(sentence, character)
  selected_chars = ''
  counter = 0

  loop do
    break if counter == sentence.size
    current_char = sentence[counter]

    if current_char == character
      selected_chars << current_char
    end

    counter += 1
  end

  selected_chars
end

question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a') # => "aaaaaaaa"
p select_letter(question, 't') # => "ttttt"
p select_letter(question, 'z') # => ""

# then we can change more string methods on the result from above to find out
# how many of those letters are in the string
p select_letter(question, 'a').size # => 8
p select_letter(question, 't').size # => 5
select_letter(question, 'z').size # => 0

# for loop is identical to loop

alphabet = 'abcdefghijklmnopqrstuvwxyz'

for char in alphabet.chars
  puts char
end