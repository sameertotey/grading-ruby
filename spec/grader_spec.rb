require 'spec_helper'
require_relative '../lib/grader'

describe Grader do
  let (:grader){Grader.new}

  describe '#translate' do
    it 'can translate an even trend' do
      input = [8, 8]
      expect(grader.translate(input)).to eq([:even])
    end

    it 'can translate an up trend' do
      input = [8, 9]
      expect(grader.translate(input)).to eq([:up])
    end

    it 'can translate a down trend' do
      input = [8, 7]
      expect(grader.translate(input)).to eq([:down])
    end

    it 'can translate a long trend' do
      input = [6,3,5,4,3,4,4,5]
      expect(grader.translate(input)).to eq([:down,:up,:down,:down,:up,:even,:up])
    end
  end

  describe '#trend' do
    it 'can identity empty trend' do
      input = []
      expect(grader.trend(input)).to eq("not in decline")
    end

    it 'can identity short trend' do
      input = [:down, :down]
      expect(grader.trend(input)).to eq("not in decline")
    end

    it 'can identity short down trend' do
      input = [:down, :down, :down]
      expect(grader.trend(input)).to eq("in decline")
    end

    it 'can identity down trend' do
      input = [:even, :even, :down, :even, :down, :even, :even, :even, :down]
      expect(grader.trend(input)).to eq("in decline")
    end

    it 'can identity down trends reversed' do
      input = [:down, :down, :down, :up]
      expect(grader.trend(input)).to eq("not in decline")
    end

  end

end