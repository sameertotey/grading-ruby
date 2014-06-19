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
    it 'can identity simple trend' do
    end
  end

end