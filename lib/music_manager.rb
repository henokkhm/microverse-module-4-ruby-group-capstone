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
end
