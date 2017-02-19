=begin
a method that takes an array of integers, and returns a new array with every other element

casual pseudo-code:
given an array of integers
declare a new array to hold every other element of the array
iterate through the array 
return all the elements to the new array if their position index is odd

formal pseudo-code:

START

# Given one array called array1
SET new_array = empty array
SET iterator = 1
SET new_iterator = 1
WHILE iterator < length of array
  if index at position iterator is odd
    set value of new_array at position new_iterator to value of array1
    new_iterator = new_iterator + 1
  iterator = iterator + 1
RETURN new_array
=end
