require 'date'
require_relative 'books_manager'

class ConsoleManager
  def initialize
    @books_manager = BooksManager.new
  end

  # add a book
  def add_book
    # Prompt
    puts
    puts 'Please provide the details of the book.'
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover State: '
    cover_state = gets.chomp

    print 'Publish Date: '
    publish_date = gets.chomp

    # Input validation
    date_pattern = %r{\A\d{4}/\d{2}/\d{2}\z}
    until publish_date.match?(date_pattern)
      puts "\nPlease enter the date in this format: YYYY/MM/DD"
      publish_date = gets.chomp
    end
    # parse publish_date into Date object
    publish_date = Date.parse(publish_date)

    print 'Archived (Y/N): '
    archived = gets.chomp.upcase

    # Action
    @books_manager.add_book(publisher, cover_state, publish_date, archived == 'Y')

    # Feedback
    puts "\nBook has been registered successfully.\n\n"
  end

  # list all books

  # add a music album

  # list all music albums

  # add a movie

  # list all movies

  # add a game

  # list of games

  # list all genres

  # list all labels

  # list all authors

  # list all sources

  # exit app
end
