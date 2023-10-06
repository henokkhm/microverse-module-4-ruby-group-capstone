class Game < Item
  attr_accessor :title, :multiplayer, :last_played_at, :id, :author

  def initialize(title, multiplayer, last_played_at, publish_date, archived)
    super(publish_date, archived)
    @title = title
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @id = nil
    @author = nil
  end

  def can_be_archived?
    # Check if the parent's method returns true and last_played_at is older than 2 years
    super && (Time.now - @last_played_at) > 2 * 365 * 24 * 60 * 60
  end

  def to_hash
    game_hash = super
    game_hash['title'] = @title
    game_hash['multiplayer'] = @multiplayer
    game_hash['last_played_at'] = @last_played_at
    game_hash
  end

  def self.from_hash(game_hash)
    game = Game.new(
      game_hash['title'],
      game_hash['multiplayer'] == 'true',
      Date.parse(game_hash['last_played_at']),
      Date.parse(game_hash['publish_date']),
      game_hash['archived'] == 'true'
    )
    game.id = game_hash['id'].to_i
    game
  end
end
