require 'date'
require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
  describe 'initialize method' do
    it 'takes title and color parameters and returns a Label' do
      my_label = Label.new('title', 'red')

      expect(my_label).to be_an_instance_of Label
      expect(my_label.title).to eql('title')
      expect(my_label.color).to eql('red')
      expect(my_label.items).to eql([])
    end
  end

  describe 'add_item method' do
    it 'takes an item object and adds it to the items array' do
      publish_date = Date.parse('2020/10/10')
      my_item = Item.new(publish_date, false)
      my_label = Label.new('title', 'red')

      my_label.add_item(my_item)

      expect(my_label.items).to eql([my_item])
      expect(my_item.label).to eql(my_label)
    end

    it 'doesn\'t add object to the items array if it is not of type Item' do
      my_item = 12
      my_label = Label.new('title', 'red')

      my_label.add_item(my_item)

      expect(my_label.items).to eql([])
    end
  end
end
