require 'date'
require_relative '../classes/book'
require_relative '../classes/item'

describe Book do
  describe 'initialize method' do
    it 'takes publisher, cover_state, publish_date (Date object), archived parameters and returns a Book' do
      publish_date = Date.parse('2020/12/12')
      my_book = Book.new('Packt', 'good', publish_date, false)

      expect(my_book).to be_an_instance_of Book
      expect(my_book).to be_a(Item)
      expect(my_book.publisher).to eql('Packt')
      expect(my_book.cover_state).to eql('good')
      expect(my_book.publish_date).to eql(publish_date)
      expect(my_book.archived).to eql(false)
    end
  end

  describe 'can_be_archived method' do
    it 'returns true when publish date is older than 10 years' do
      publish_date = Date.parse('2010/12/12')
      my_book = Book.new('Packt', 'good', publish_date, false)
      expect(my_book.can_be_archived?).to eql(true)
    end

    it 'returns true when cover state is bad' do
      publish_date = Date.parse('2010/12/12')
      my_book = Book.new('Packt', 'bad', publish_date, false)
      expect(my_book.can_be_archived?).to eql(true)
    end

    it 'returns false when publish date is more recent than 10 years and cover state is not bad' do
      publish_date = Date.parse('2020/12/12')
      my_book = Book.new('Packt', 'good', publish_date, false)
      expect(my_book.can_be_archived?).to eql(false)
    end
  end
end
