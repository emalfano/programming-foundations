=begin
a method that takes an array of strings, and returns a string that is all those strings concatenated together

casual pseudo-code:
given an array of strings
iterate through the array 
declare a string value a_string
concatenate each value to a_string until there are no more elements 
 
return a_string

formal pseudo-code:

START

# Given one array called array1
SET a_string = first element of array
SET iterator = 1
WHILE iterator < length of array
  a_string = a_string + array element at position iterator
  iterator = iterator + 1

=end
array = ["one", "two", "three"]
a_string = array[0]
iterator = 1
while iterator < array.length do
  a_string += array[iterator]
  iterator += 1
end
puts a_string