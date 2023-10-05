class Author
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    return unless item.can_be_archived?

    @items << item
    item.set_author(self)
  end
end
