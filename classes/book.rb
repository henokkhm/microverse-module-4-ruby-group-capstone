require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, archived)
    super(publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if super || @cover_state == 'bad'

    false
  end

  def to_hash
    item_hash = super
    book_hash = {
      'publisher' => @publisher,
      'cover_state' => @cover_state
    }

    item_hash.merge(book_hash)
  end
end
