module MainMenu
  @menu = '
Please select an action from the list below:

1. Add a book
2. List all books

3. Add a music album
4. List all music albums

5. Add a movie
6. List all movies

7. Add a game
8. List of games

9. List all genres
10. List all labels
11. List all authors
12. List all sources

13. Exit

'

  def self.prompt
    puts @menu
    choice = gets.chomp
    until %w[1 2 3 4 5 6 7 8 9 10 11 12 13].include?(choice)
      puts 'Please enter a valid choice:'
      choice = gets.chomp
    end
    choice
  end
end
