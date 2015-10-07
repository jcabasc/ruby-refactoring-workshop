require File.expand_path('../setup.rb', __FILE__)

class Student
  def calculate_final_grade_status(raw_average)

    derived_precision = precision(raw_average)
    whole_average = average(raw_average)

    if derived_precision < 0.25
      final_grade = whole_average
    elsif derived_precision >= 0.25 && derived_precision < 0.75
      final_grade = whole_average + 0.50
    else
      final_grade = raw_average.ceil
    end

    if final_grade < 3.75
      "Fail, you know nothing #{self.student_name}"
    else
      "Pass, you're doing it great #{self.student_name}"
    end
  end

  private

  def average(raw_average)
    raw_average.to_i
  end

  def precision(raw_average)
    (raw_average - average(raw_average)).round(2)
  end
end

require File.expand_path('../tests.rb', __FILE__) if __FILE__ == $0
