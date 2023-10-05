require 'date'
require_relative 'books_manager'
require_relative 'music_manager'
require_relative 'game_manager'
require_relative 'genre_manager'

class ConsoleManager
  def initialize
    @books_manager = BooksManager.new
    @music_manager = MusicManager.new
    @game_manager = GameManager.new
    @genres_manager = GenreManager.new
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
  def add_game
    # Prompt
    puts
    puts 'Please provide the details of the game.'
    print 'Title: '
    title = gets.chomp
    print 'Multiplayer (Y/N): '
    multiplayer = gets.chomp.upcase
    print 'Last Played Date (YYYY/MM/DD): '
    last_played_date = gets.chomp
    print 'Publish Date (YYYY/MM/DD): '
    publish_date = gets.chomp

    # Input validation
    date_pattern = %r{\A\d{4}/\d{2}/\d{2}\z}
    until publish_date.match?(date_pattern)
      puts "\nPlease enter the date in this format: YYYY/MM/DD"
      publish_date = gets.chomp
    end

    # Parse dates into Date objects
    last_played_at = Date.parse(last_played_date)
    publish_date = Date.parse(publish_date)

    print 'Archived (Y/N): '
    archived = gets.chomp.upcase

    # Action
    @game_manager.add_game(title, multiplayer == 'Y', last_played_at, publish_date, archived == 'Y')

    # Feedback
    puts "\nGame has been registered successfully.\n\n"
  end

  # List all games
  def list_all_games
    games = @game_manager.games_list
    if games.length.positive?
      puts 'Here are all the games in your catalog:'
      games.each do |game|
        puts "Title: #{game.title}, Multiplayer: #{game.multiplayer ? 'Yes' : 'No'}, " \
             "Last Played At: #{game.last_played_at}, Archived: #{game.archived ? 'Yes' : 'No'}"
      end
    else
      puts "\nThere are no registered games."
    end
  end

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
  def list_all_authors
    authors = @game_manager.authors_list
    if authors.length.positive?
      puts 'Here are all the authors in your catalog:'
      authors.each_with_index do |author, index|
        puts "#{index + 1}. Name: #{author.full_name}"
      end
    else
      puts "\nThere are no registered authors."
    end
  end

  # list all sources

  # exit app
  def exit
    puts 'Thank you for using this app!'
  end
end
