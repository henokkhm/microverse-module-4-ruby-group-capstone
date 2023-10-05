require 'date'
require_relative 'books_manager'
require_relative 'music_manager'

class ConsoleManager
  def initialize
    @books_manager = BooksManager.new
    @music_manager = MusicManager.new
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
  def add_music
    # Prompt
    puts
    puts 'Please provide the details of the Music Album.'

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

    print 'On Spotify (Y/N): '
    on_spotify = gets.chomp.upcase

    # Action
    @music_manager.add_music(publish_date, on_spotify == 'Y', archived == 'Y')

    # Feedback
    puts "\nMusic Album has been registered successfully.\n\n"
  end

  # list all books

  # list all music albums
  def list_all_music
    musics = @music_manager.music_list
    if musics.length.positive?
      puts 'Here are all the Music Album in your catalog:'
      musics.each_with_index do |music, _index|
        puts " On spotify: #{music.on_spotify ? 'Yes' : 'No'}, " \
             "Publish Date: #{music.publish_date}, Archived: #{music.archived ? 'Yes' : 'No'}"
      end
    else
      puts "\nThere are no registered Music Album."
    end
  end

  # add a movie

  # list all movies

  # add a game

  # list of games

  # list all genres
  def list_all_genres
    genres = @music_manager.music_list.map(&:genre).compact
    # TODO: add labels also from other catalog item types
    if genres.length.positive?
      puts 'Here are all the genres in your catalog:'
      genres.each_with_index do |genre, _index|
        puts "Genre : #{genre.name}"
      end
    else
      puts "\nThere are no genres in your catalog."
    end
  end

  # list all labels
  def list_all_labels
    labels = @books_manager.books_list.map(&:label).compact
    # TODO: add labels also from other catalog item types
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
    puts 'Thank you for using this app!'
  end
end
