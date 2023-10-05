# music_album_spec.rb
require_relative '../classes/music_album'
require_relative '../classes/item'

describe MusicAlbum do
  let(:today) { Date.today }
  let(:ten_years_ago) { today - (10 * 365) }

  context 'when creating a music album' do
    it 'has an ID' do
      album = MusicAlbum.new(today, true, false)
      expect(album.id).to be_an(Integer)
    end

    it 'raises an ArgumentError if publish_date is not a Date' do
      expect { MusicAlbum.new('invalid_date', true, false) }.to raise_error(ArgumentError)
    end

    it 'is not archived by default' do
      album = MusicAlbum.new(today, true, false)
      expect(album.archived).to be(false)
    end

    it 'has an on_spotify attribute' do
      album = MusicAlbum.new(today, true, false)
      expect(album.on_spotify).to be(true)
    end
  end
end
