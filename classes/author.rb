require 'item'

class Author
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def add_item(item)
    item.set_author(self)
  end
end
