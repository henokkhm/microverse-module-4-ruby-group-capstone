require 'date'
require_relative '../classes/game'

describe Game do
  let(:publish_date) { Date.new(2010, 1, 1) }
  let(:archived) { false }
  let(:game) { Game.new('Game Title', 'Multiplayer', (Time.now - (3 * 365 * 24 * 60 * 60)), publish_date, archived) }

  it 'inherits properties from Item class' do
    expect(game.title).to eq('Game Title')
    expect(game.multiplayer).to eq('Multiplayer')
    expect(game.last_played_at).to be_within(1).of(Time.now - (3 * 365 * 24 * 60 * 60))
    expect(game.publish_date).to eq(publish_date)
    expect(game.archived).to eq(archived)
  end

  it 'can be archived when last played more than 2 years ago' do
    expect(game.can_be_archived?).to be true
  end

  it 'cannot be archived when last played less than 2 years ago' do
    recent_game = Game.new('Recent Title', 'Multiplayer', Time.now, publish_date, archived)
    expect(recent_game.can_be_archived?).to be false
  end

  it 'can be archived using move_to_archive method' do
    game.move_to_archive
    expect(game.archived).to be true
  end
end
