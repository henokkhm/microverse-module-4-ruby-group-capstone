require_relative 'lib/main_menu'
require_relative 'lib/console_manager'

module Main
  include MainMenu
  console_manager = ConsoleManager.new
  puts '🎉 Welcome to the My Catalog App! 🎉'
  puts 'This application lets you keep track of all your 📖 books, 💿 music albums, 🎥 movies, and 🎮 games.'
  loop do
    main_menu_choice = MainMenu.prompt

    case main_menu_choice
    when '1'
      console_manager.add_book
    when '2'
      console_manager.list_all_books
    when '3'
      console_manager.add_music
    when '4'
      console_manager.list_all_music
    when '5'
      puts '\'Add a movie\' action not implemented.'
    when '6'
      puts '\'List all movies\' action not implemented.'
    when '7'
      console_manager.add_game
    when '8'
      console_manager.list_all_games
    when '9'
      console_manager.list_all_genres
    when '10'
      console_manager.list_all_labels
    when '11'
      console_manager.list_all_authors
    when '12'
      puts '\'List all sources\' action not implemented.'
    when '13'
      console_manager.exit
      break
    end
  end
end
