require_relative 'item'

class Author
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def add_item(item)
    return unless item.can_be_archived?

    @items << item
    item.set_author(self)
  end

  def to_hash
    {
      'first_name' => @first_name,
      'last_name' => @last_name
    }
  end

  def self.from_hash(author_hash)
    Author.new(
      author_hash['first_name'],
      author_hash['last_name']
    )
  end
end
