require_relative 'lib/main_menu'

module Main
  include MainMenu
  puts '🎉 Welcome to the My Catalog App! 🎉'
  loop do
    main_menu_choice = MainMenu.prompt

    case main_menu_choice
    when '1'
      puts 'performing action #1'
    when '2'
      puts 'performing action #2'
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
      puts 'Exiting...'
      break
    end
  end
end
