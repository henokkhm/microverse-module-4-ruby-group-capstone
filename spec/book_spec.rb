require 'date'
require_relative '../classes/book'
require_relative '../classes/item'

describe Book do
  describe 'initialize function' do
    it 'takes publisher, cover_state, publish_date (Date object), archived string parameters and returns a Book object' do
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
end
