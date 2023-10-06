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

  def save_games_to_json
    file_path = 'json/games.json'
    File.open(file_path, 'w') do |file|
      json_data = @games_list.map(&:to_hash)

      file.puts JSON.pretty_generate(json_data)
    end
  end

  def load_games_from_json(filename)
    games_data = JSON.parse(File.read(filename))
    @games_list = games_data.map { |data| Game.from_hash(data) }
  end
end
