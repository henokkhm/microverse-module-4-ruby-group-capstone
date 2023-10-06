require_relative '../classes/genre'

class GenreManager
  def initialize
    @genres_list = []
  end

  attr_reader :genres_list

  def add_genre(name)
    genre = Genre.new(name)
    @genres_list.push(genre)
    genre
  end

  def save_to_file
    file_path = 'json/genres.json'
    genres_data = @genres_list.map(&:to_hash)
    File.open(file_path, 'w') do |file|
      file.puts JSON.pretty_generate(genres_data)
    end
  end

  def load_from_file
    file_path = 'json/genres.json'
    return unless File.exist?(file_path)

    genre_data = JSON.parse(File.read(file_path))
    genre_data.each do |genre_hash|
      genre = add_genre(genre_hash['name'])
      genre.id = genre_hash['id']
    end
  end
end
