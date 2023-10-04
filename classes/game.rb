require_relative 'item'

class Game
  attr_accessor :title, :platform, :last_played_at

  def initialize(title, platform, last_played_at)
    @title = title
    @platform = platform
    @last_played_at = last_played_at
  end

  def can_be_archived?
    # Check if the parent's method returns true and last_played_at is older than 2 years
    super && (Time.now - @last_played_at) > 2 * 365 * 24 * 60 * 60
  end
end
