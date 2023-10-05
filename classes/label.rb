class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = Random.rand(1..10_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    return unless item.instance_of?(Item)

    items << item
    item.label = self
  end

  def to_hash
    {
      'id' => @id,
      'title' => @title,
      'color' => @color
    }
  end
end
