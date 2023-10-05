require 'date'
require_relative 'books_manager'
require_relative 'labels_manager'

class ConsoleManager
  def initialize
    @books_manager = BooksManager.new
    @labels_manager = LabelsManager.new

    # load data from files if files exist
    @labels_manager.load_from_file
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

    new_book = @books_manager.add_book(publisher, cover_state, publish_date, archived == 'Y')

    add_label(new_book)
    # Feedback
    puts "\nBook has been registered successfully.\n\n"
  end

  def add_label(book)
    # Add book label?
    print 'Do you want to add a label to this book? (Y/N)'
    want_label = gets.chomp.upcase

    return unless want_label == 'Y'

    print 'Label title: '
    label_title = gets.chomp
    print 'Label color: '
    label_color = gets.chomp

    new_label = @labels_manager.add_label(label_title, label_color)
    book.label = new_label
  end

  # list all books
  def list_all_books
    books = @books_manager.books_list
    if books.length.positive?
      puts 'Here are all the books in your catalog:'
      books.each_with_index do |book, _index|
        puts "Publisher: #{book.publisher}, Cover state: #{book.cover_state}, " \
             "Publish Date: #{book.publish_date}, Archived: #{book.archived ? 'Yes' : 'No'}"
      end
    else
      puts "\nThere are no registered books."
    end
  end

  # add a music album

  # list all music albums

  # add a movie

  # list all movies

  # add a game

  # list of games

  # list all genres

  # list all labels
  def list_all_labels
    labels = @labels_manager.labels_list
    if labels.length.positive?
      puts 'Here are all the labels in your catalog:'
      labels.each_with_index do |label, _index|
        puts "Title: #{label.title}, Color: #{label.color}"
      end
    else
      puts "\nThere are no labels in your catalog."
    end
  end

  # list all authors

  # list all sources

  # exit app
  def exit
    puts 'Saving data...'
    @labels_manager.save_to_file
    puts 'Your catalog has been saved.'
    puts 'Thank you for using this app!'
  end
end
