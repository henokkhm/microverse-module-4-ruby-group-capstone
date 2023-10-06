require_relative 'item'
require 'date'

class MusicAlbum < Item
  attr_reader :id, :on_spotify

  def initialize(publish_date, on_spotify, archived)
    super(publish_date, archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10 && @on_spotify == true
  end

  def to_hash
    item_hash = super
    music_album_hash = {
      'on_spotify' => @on_spotify
    }

    item_hash.merge(music_album_hash)
  end
end
