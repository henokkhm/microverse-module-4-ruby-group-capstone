require_relative '../classes/game'

class GameManager
  def initialize
    @games_list = []
  end

  attr_reader :games_list

  def add_game(title, multiplayer, last_played_at, publish_date, archived)
    game = Game.new(title, multiplayer, last_played_at, publish_date, archived)
    @games_list.push(game)
    game
  end

  def authors_list
    authors
  end
end
