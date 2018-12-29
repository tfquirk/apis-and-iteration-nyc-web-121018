require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  characters = response_hash["results"]
  character_hash = characters.select {|character| character["name"].downcase == character_name}

  movie_array = []
  character_hash[0]["films"].each {|el| movie_array << RestClient.get(el)}

  parsed_array = movie_array.map {|el| JSON.parse(el)}
  parsed_array


  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  film_array =films.map {|film| film["title"]}
  film_array.each {|film| puts film}
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)

  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
