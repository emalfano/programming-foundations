=begin
def string_lengths(sentence)
  strings = sentence.split

  strings.map { |chars| chars.length }
end

p string_lengths('a to two four')

def string_lengths(sentence)
  strings = sentence.split
  lengths = []

  strings.each do |string|
    lengths << string.size
    p lengths
  end
end

p string_lengths('a to two four')

def string_lengths(sentence)
  words = sentence.split
  word_lengths = []
  counter = 0

  while counter < words.size do
    word_lengths << words[counter].length
    counter += 1
  end

  word_lengths
end
p string_lengths('a to two four')

def string_lengths(sentence)
  strings = sentence.split
  p strings
  lengths = []
  counter = 1

  until counter == strings.size do
    word_length = strings[counter - 1].length
    lengths.push(word_length)
    counter += 1
  end

  lengths
end
p string_lengths('a to two four')


user_input = gets

loop do
  name = user_input
  break
end


if user_input
  puts "Hello " + name
end

def extend_greeting(greeting)
  greeting + " there"
end

greeting = "hi"
puts extend_greeting(greeting)

def mutate(obj)
  obj = 2
end
obj = 1
mutate(obj)
puts obj
=end

def name
  "George"
end

name = "Lisa"

def display_name(name)
  puts name
end

display_name(name)