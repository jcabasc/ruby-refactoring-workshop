require File.expand_path('../setup.rb', __FILE__)

class Student

  MINIMUN_GRADE_REQUIRED =  3.75

  def calculate_final_grade_status(raw_average)
    final_grade = FinalGradeCalculator.for(raw_average)
    self.status_message(final_grade)
  end

  def status_message(final_grade)
    if final_grade < MINIMUN_GRADE_REQUIRED
      "Fail, you know nothing #{self.student_name}"
    else
      "Pass, you're doing it great #{self.student_name}"
    end
  end
end

class FinalGradeCalculator

  attr :raw_average

  def self.for(raw_average)
    new(raw_average).call
  end

  def initialize(raw_average)
    @raw_average = raw_average
  end

  def call
    final_grade
  end

  def final_grade
    case
    when derived_precision < 0.25
      whole_average
    when derived_precision >= 0.25 && derived_precision < 0.75
      whole_average + 0.50
    else
      raw_average.ceil
    end
  end

  private

  def whole_average
    @whole_average ||= raw_average.to_i
  end

  def derived_precision
    @derived_precision ||= (raw_average - whole_average).round(2)
  end

end

require File.expand_path('../tests.rb', __FILE__) if __FILE__ == $0
