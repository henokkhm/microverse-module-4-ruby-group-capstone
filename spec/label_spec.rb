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
end
