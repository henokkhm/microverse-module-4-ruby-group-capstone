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
      puts 'performing action #3'
    when '4'
      puts 'performing action #4'
    when '5'
      puts 'performing action #5'
    when '6'
      puts 'performing action #6'
    when '7'
      puts 'performing action #7'
    when '8'
      puts 'performing action #8'
    when '9'
      puts 'performing action #9'
    when '10'
      puts 'performing action #10'
    when '11'
      puts 'performing action #11'
    when '12'
      puts 'performing action #12'
    when '13'
      console_manager.exit
      break
    end
  end
end
