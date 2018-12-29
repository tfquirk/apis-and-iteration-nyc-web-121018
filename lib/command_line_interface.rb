def welcome
  puts "Welcome, we're excited to get started!"
end

def get_character_from_user
  puts "Please enter a character name: "
  # use gets to capture the user's input. This method should return that input, downcased.
  response = gets.chomp
  response.downcase
end
