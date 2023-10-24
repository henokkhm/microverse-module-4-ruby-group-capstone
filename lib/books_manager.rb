require 'date'
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

  def save_to_file
    file_path = 'json/books.json'
    books_data = @books_list.map(&:to_hash)
    File.open(file_path, 'w') do |file|
      file.puts JSON.pretty_generate(books_data)
    end
  end

  def load_from_file
    file_path = 'json/books.json'
    return unless File.exist?(file_path)

    book_data = JSON.parse(File.read(file_path))
    book_data.each do |book_hash|
      publish_date = Date.parse(book_hash['publish_date'])
      archived = book_hash['archived'] == 'true'
      book = add_book(book_hash['publisher'], book_hash['cover_state'], publish_date, archived)
      book.id = book_hash['id']

      # Temoporarily store ids of properties, the associations will be restored once
      # the .json files for Genre, Author, Source, and Label are loaded
      book.genre = book_hash['genre']
      book.author = book_hash['author']
      book.source = book_hash['source']
      book.label = book_hash['label']
    end
  end
end
