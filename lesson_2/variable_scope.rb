#variable scope examples

# outer scope variables can be accessed by inner scope
a = 1         # outer scope variable

loop do       # the block creates an inner scope
  puts a      # => 1
  a = a + 1   # "a" is re-assigned to a new value
  break       # necessary to prevent infinite loop
end

puts a        # => 2  "a" was re-assigned in the inner scope
# In procedural style programming, constants behave like globals
# this works even though constant is used inside the method
USERNAME = 'Batman'

def authenticate
  puts "Logging in #{USERNAME}"
end

authenticate    # => Logging in Batman

# initializing constants in an inner scope
loop do
  MY_TEAM = "Phoenix Suns"
  break
end