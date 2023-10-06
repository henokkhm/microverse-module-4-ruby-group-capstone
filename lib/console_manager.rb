require 'date'
require_relative 'books_manager'
require_relative 'labels_manager'
require_relative 'music_manager'
require_relative 'genre_manager'

class ConsoleManager
  def initialize
    @books_manager = BooksManager.new
    @labels_manager = LabelsManager.new
    @music_manager = MusicManager.new
    @genres_manager = GenreManager.new

    # load data from files if files exist
    # Note: the order of the following statements is important
    @labels_manager.load_from_file
    @books_manager.load_from_file

    @genres_manager.load_from_file
    @music_manager.load_from_file

    # Restore the relationship between Books and Labels
    labels = @labels_manager.labels_list
    books = @books_manager.books_list

    return unless labels.length.positive?

    books.each do |book|
      next if book.label.nil?

      book_label = labels.find { |label| label.id == book.label }
      book.label = book_label
      book_label.add_item(book)
    end

    
    genres = @genres_manager.genres_list
    musics = @music_manager.music_list
    return unless genres.length.positive?

    musics.each do |music|
      next if music.genre.nil?

      music_genre = genres.find { |genre| genre.id == music.genre }
      music.genre = music_genre
      music_genre.add_item(music)
    end
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
             "Publish Date: #{book.publish_date}, Archived: #{book.archived ? 'Yes' : 'No'}, " \
             "Label: #{book.label ? book.label.title : 'N/A'}"
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
    new_music = @music_manager.add_music(publish_date, on_spotify == 'Y', archived == 'Y')

    add_genre(new_music)

    # Feedback
    puts "\nMusic Album has been registered successfully.\n\n"
  end

  def add_genre(music)
    # Add book label?
    print 'Do you want to add a genre to this book? (Y/N)'
    want_genre = gets.chomp.upcase

    return unless want_genre == 'Y'

    print 'Genre name: '
    genre_name = gets.chomp

    new_genre = @genres_manager.add_genre(genre_name)
    music.genre = new_genre
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
    # TODO: add genres also from other catalog item types
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
    @books_manager.save_to_file
    @genres_manager.save_to_file
    @music_manager.save_to_file
    puts 'Your catalog has been saved.'
    puts 'Your Album has been saved.'
    puts 'Thank you for using this app!'
  end
end
