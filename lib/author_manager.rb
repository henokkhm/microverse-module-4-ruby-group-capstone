require_relative '../classes/author'

class AuthorManager
  attr_reader :authors_list

  def initialize
    @authors_list = []
  end

  def add_author(first_name, last_name)
    author = Author.new(first_name, last_name)
    @authors_list << author
    author
  end

  def save_authors_to_json
    file_path = 'json/authors.json'
    File.open(file_path, 'w') do |file|
      json_data = @authors_list.map(&:to_hash)

      file.puts JSON.pretty_generate(json_data)
    end
  end

  def load_authors_from_json
    file_path = 'json/authors.json'
    return unless File.exist?(file_path)

    author_data = JSON.parse(File.read(file_path))
    author_data.each do |author_hash|
      author = add_author(author_hash['first_name'], author_hash['last_name'])
      author.id = author_hash['id']
    end
  end
end
