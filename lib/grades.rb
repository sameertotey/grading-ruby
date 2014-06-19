require 'json'

class GradesRepository
  attr_reader :file, :data
  def initialize(file='./data/grades.json')
    @file = file
  end

  def load
    @data = JSON.parse(File.read(@file))
  end
end