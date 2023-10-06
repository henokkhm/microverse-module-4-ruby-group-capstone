require_relative '../classes/author'

describe Author do
  let(:author) { Author.new('Stephen', 'King') }

  it 'has a full name' do
    expect(author.full_name).to eq('Stephen King')
  end

  it "can add items to the author's collection when they can be archived" do
    item = double('item', can_be_archived?: true)
    allow(item).to receive(:set_author)

    author.add_item(item)

    expect(author.items).to include(item)
  end

  it "does not add items to the author's collection when they cannot be archived" do
    item = double('item', can_be_archived?: false)
    allow(item).to receive(:set_author)

    author.add_item(item)

    expect(author.items).not_to include(item)
  end
end
