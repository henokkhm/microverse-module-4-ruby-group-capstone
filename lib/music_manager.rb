require_relative '../classes/music_album'

class MusicManager
  def initialize
    @music_list = []
  end

  attr_reader :music_list

  def add_music(publish_date, on_spotify, archived)
    music = MusicAlbum.new(publish_date, on_spotify, archived)
    @music_list.push(music)
    music
  end

  def save_to_file
    file_path = 'json/musics.json'
    puts 'saving musics'
    musics_data = @musics_list.map(&:to_hash)
    File.open(file_path, 'w') do |file|
      file.puts JSON.pretty_generate(musics_data)
    end
  end

  def load_from_file
    file_path = 'json/musics.json'
    return unless File.exist?(file_path)

    music_data = JSON.parse(File.read(file_path))
    music_data.each do |music_hash|
      publish_date = Date.parse(book_hash['publish_date'])
      archived = music_hash['archived'] == 'true'
      music = add_music(music_hash['publisher'], publish_date, archived)
      music.id = music_hash['id']

      # Temoporarily store ids of properties, the associations will be restored once
      # the .json files for Genre, Author, Source, and Label are loaded
      book.genre = book_hash['genre_id']
      book.author = book_hash['author_id']
      book.source = book_hash['source_id']
      book.label = book_hash['label_id']
    end
  end
end
