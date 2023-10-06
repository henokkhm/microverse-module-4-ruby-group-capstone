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

  def load_games_from_json
    file_path = 'json/games.json'
    return unless File.exist?(file_path)

    game_data = JSON.parse(File.read(file_path))
    game_data.each do |game_hash|
      title = game_hash['title']
      publish_date = Date.parse(game_hash['publish_date'])
      last_played_at = Date.parse(game_hash['last_played_at'])
      archived = game_hash['archived'] == 'true'
      multiplayer = game_hash['multiplayer'] == 'true'

      game = add_game(title, multiplayer, last_played_at, publish_date, archived)
      game.id = game_hash['id']

      # Temoporarily store ids of properties, the associations will be restored once
      # the .json files for Genre, Author, Source, and Label are loaded
      game.genre = game_hash['genre']
      game.author = game_hash['author']
      game.source = game_hash['source']
      game.label = game_hash['label']
    end
  end
end
