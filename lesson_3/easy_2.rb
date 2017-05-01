# Q 1
# See if Spot is present
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts ages.has_key?("Spot")
puts ages.key?("Spot")
# bonus what are 2 other hash methods that would work as well

puts ages.include?("Spot")
puts ages.member?("Spot")

#Q 2
munsters_description = "The Munsters are creepy in a good way."
=begin
Convert the string in the following ways (code will be executed on original 
munsters_description above):
"The munsters are creepy in a good way."
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
=end
puts munsters_description.capitalize
puts munsters_description.swapcase
puts munsters_description.downcase
puts munsters_description.upcase

# Q 3
# add ages for Marilyn and Spot to the existing hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
puts ages

# Q 4
# See if the name "Dino" appears in this string
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.include?("Dino")
# LS solution
puts advice.match("Dino").inspect

# Q 5
# show an easier way to write this array
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
p flintstones
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

# Q 6
# How can we add Dino to the array
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
p flintstones
flintstones.concat(["Dino2", "Hoppy"])
p flintstones
flintstones.push("Dino3")
p flintstones

# Q 7
# Push multiple items to flintstones

flintstones.push('Dino').push('Hoppy')  # push returns the array so we can
                                        # chain
p flintstones

flintstones.concat(%w(Dino Hoppy))
p flintstones

# Q 8
# shorten this sentence - remove everything starting with house
# Review the String#slice! documentation, and use that method to make the return
# value "Few things in life are as important as ". But leave the advice variable
# as "house training your pet dinosaur.".
advice = "Few things in life are as important as house training your pet \
dinosaur."
puts advice.slice!(0..38)
puts advice

# Use slice
advice = "Few things in life are as important as house training your pet \
dinosaur."
puts advice.slice(0..38) # slice doesn't change advice
puts advice

puts advice.slice!(0, advice.index('house'))
puts advice

# Q 9
# write a one-line to count all the lower case t characters
statement = "The Flintstones Rock!"
puts statement.count('t')

# Q 10
#  If we had a 40 character wide table of Flintstone family members, how could we easily center that title above the table with spaces?
title = "Flintstone Family Members"
puts title.size
starting_position = 40 - title.size / 2
puts starting_position
p title.center(40)
