# genre_spec.rb
require_relative '../classes/genre'
require_relative '../classes/item'

describe Genre do
  let(:genre_name) { 'Rock' }
  let(:genre) { Genre.new(genre_name) }

  context 'when creating a genre' do
    it 'should have a name' do
      expect(genre.name).to eq(genre_name)
    end

    it 'should have an empty list of items' do
      expect(genre.items).to be_empty
    end

    it 'should set the genre of the added item to itself' do
      item = double('item')
      expect(item).to receive(:genre=).with(genre)
      genre.add_item(item)
    end
  end
end
