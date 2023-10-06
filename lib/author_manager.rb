require_relative '../classes/author'

class AuthorManager
  attr_reader :authors

  def initialize
    @authors = []
  end

  def add_author(first_name, last_name)
    author = Author.new(first_name, last_name)
    @authors << author
    author
  end

  def save_authors_to_json(filename)
    authors_data = @authors.map(&:to_hash)
    File.open(filename, 'w') do |file|
      file.puts JSON.pretty_generate(authors_data)
    end
  end

  def load_authors_from_json(filename)
    authors_data = JSON.parse(File.read(filename))
    @authors = authors_data.map { |data| Author.from_hash(data) }
  end
end
