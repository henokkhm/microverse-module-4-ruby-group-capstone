require_relative '../classes/book'

class BooksManager
  def initialize
    @books_list = []
  end

  attr_reader :books_list

  def add_book(publisher, cover_state, publish_date, archived)
    book = Book.new(publisher, cover_state, publish_date, archived)
    @books_list.push(book)
    book
  end
end
