require 'spec_helper'
require_relative '../lib/grading'
require_relative '../lib/grades'

describe Grading do
  before(:each) do
    @grading = Grading.new
    @grades_repo = GradesRepository.new('./spec/data/grades.json')
  end
  
  it "creates a new object" do
    expect(@grading).to be
  end

  it 'accepts grades repo assignment' do
    @grading.grades_data = @grades_repo.load
    expect(@grading.grades_data).to eq(@grades_repo.load)
  end

  context "#evaluate" do
    it "produces summary of all student trends" do
      result = {
                  :downward => 27,
                  :total => 100
                }
      @grading.grades_data = @grades_repo.load
      expect(@grading.evaluate).to eq(result)
    end
  end


end