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
end
