require_relative '../classes/label'

class LabelsManager
  def initialize
    @labels_list = []
  end

  attr_reader :labels_list

  def add_label(title, color)
    label = Label.new(title, color)
    @labels_list.push(label)
    label
  end
end
