require_relative '../classes/book'

describe Book do
  describe 'initialize function' do
    it 'takes publisher, cover_state, publish_date, archived string parameters and returns a Book object' do
      my_book = Book.new('Packt', 'good', '2020/12/12', false)
      expect(my_book).to be_an_instance_of Book
      expect(my_book.publisher).to eql('Packt')
      expect(my_book.cover_state).to eql('good')
      expect(my_book.publish_date).to eql('2020/12/12')
      expect(my_book.archived).to eql(false)
    end
  end
end
