require_relative '../classes/music_album'
require 'date'

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
    musics_data = @music_list.map(&:to_hash)
    File.open(file_path, 'w') do |file|
      file.puts JSON.pretty_generate(musics_data)
    end
  end

  def load_from_file
    file_path = 'json/musics.json'
    return unless File.exist?(file_path)

    music_data = JSON.parse(File.read(file_path))
    music_data.each do |music_hash|
      publish_date = Date.parse(music_hash['publish_date'])
      archived = music_hash['archived'] == 'true'
      on_spotify = music_hash['on_spotify'] == 'true'
      music = add_music(publish_date, on_spotify, archived)
      music.id = music_hash['id']

      # Temoporarily store ids of properties, the associations will be restored once
      # the .json files for Genre, Author, Source, and Label are loaded
      music.genre = music_hash['genre']
      music.author = music_hash['author']
      music.source = music_hash['source']
      music.label = music_hash['label']
    end
  end
end
