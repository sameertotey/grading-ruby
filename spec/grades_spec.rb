require 'spec_helper'
require_relative '../lib/grades.rb'

describe GradesRepository do
  context "creates object" do
    it "with defauts" do
      grades_repo = GradesRepository.new
      expect(grades_repo).to be
    end

    it "with file location" do
      grades_repo = GradesRepository.new('./spec/data/grades.json')
      expect(grades_repo).to be
    end
  end

  context "#load" do
    it "load sales data" do
      grades_repo = GradesRepository.new('./spec/data/grades.json')
      expect(grades_repo.load.count).to eq 100
    end
  end
 
end