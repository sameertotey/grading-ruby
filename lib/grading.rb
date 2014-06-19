require_relative '../lib/grader'

class Grading
  attr_accessor :grades_data

  def evaluate
    result = {}
    total, downward = 0, 0
    grader = Grader.new
    @grades_data.each do |student, grades|
      if grader.trend(grader.translate(grades)) == "in decline"
        downward += 1
      end
      # puts "#{student} has #{grades}"
      total += 1
    end
    result[:downward] = downward
    result[:total] = total
    result
  end
end
