require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date
  attr_reader :archived

  def initialize(publish_date, archived)
    unless publish_date.is_a?(Date)
      raise ArgumentError,
            "Invalid date parameter: #{publish_date}. publish_date must be a Date object."
    end

    @id = Random.rand(1..10_000)
    @publish_date = publish_date || Date.today
    @archived = archived
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
  end

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def to_hash
    {
      'id' => @id,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'genre' => extract_id(genre),
      'author' => extract_id(author),
      'source' => extract_id(source),
      'label' => extract_id(label)
    }
  end

  private

  def extract_id(item)
    return nil if item.nil?

    item.id
  end
end
