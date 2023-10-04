require_relative '../classes/author.rb'  # Assuming your Author class is in an 'author.rb' file

# Describe the Author class and its behavior
describe Author do
  let(:author) { Author.new("Stephen King") }

  it "has a name attribute" do
    expect(author.name).to eq("Stephen King")
  end

  it "can add an item to the author's collection" do
    # Create a sample item
    item = double("Item")

    expect(item).to receive(:set_author).with(author)

    # Call the add_item method
    author.add_item(item)
  end
end
