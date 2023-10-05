class Item
  attr_accessor :title, :published_date, :archived, :items

  def initialize(title, published_date)
    @title = title
    @published_date = published_date
    @archived = false
    @items = []
  end

  def can_be_archived?
    (Time.now - @published_date) > 10 * 365 * 24 * 60 * 60
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
