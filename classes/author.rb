require_relative 'item'

class Author < Item
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name, publish_date = nil, archived = false)
    super(publish_date, archived)
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
    item.author = self
  end
end
