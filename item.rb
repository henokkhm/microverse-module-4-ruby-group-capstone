class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id, :archived

  def initialize(publish_date, archived)
    @id = Random.rand(1..10_000)
    @publish_date = publish_date || Date.today
    @archived = archived
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
  end

  def can_be_archived?
    (Date.today.year - @publish_date.year) >= 10
  end

end
