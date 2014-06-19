class Grader
  def translate input
    last_grade = input.first
    remaining_grades = input[1..-1]
    result = []
    remaining_grades.each do |grade|
      result << case 
                when grade > last_grade
                  :up
                when grade < last_grade
                  :down
                else
                  :even
                end
      last_grade = grade
    end
    result
  end

  def trend
  end
end
