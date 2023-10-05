require_relative '../classes/genre'

class GenreManager
  def initialize
    @genres_list = []
  end

  attr_reader :genre_list

  def add_genre(name)
    genre = Genre.new(name)
    @genres_list.push(genre)
    genre
  end
end
