class Grader
  def translate(grades)
    last_grade = grades.first
    remaining_grades = grades[1..-1]
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

  def trend(steps)
    consecutive_down = 0
    result = "not in decline"
    steps.each do |step|
      if step == :up
        consecutive_down = 0
      elsif step == :down
        consecutive_down += 1
      end
    end
    if consecutive_down >= 3
      result = "in decline"
    end
    result
  end
end
