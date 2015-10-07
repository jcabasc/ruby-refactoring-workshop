#!/usr/bin/env ruby -w
require 'minitest/autorun'

class TestStudent < Minitest::Test

  def test_final_grade_message_when_student_fail
    student = Student.new("Jon Snow")
    grades = [2.45, 3.0, 4.3, 3.5]
    raw_average = grades.inject(0.0) { |sum, el| sum + el } / grades.size
    status = student.calculate_final_grade_status(raw_average)
    assert_equal "Fail, you know nothing Jon Snow", status
  end

  def test_final_grade_message_when_student_pass
    student = Student.new("Sam Tarly")
    grades = [4.0, 3.5, 4.7, 3.5]
    raw_average = grades.inject(0.0) { |sum, el| sum + el } / grades.size
    status = student.calculate_final_grade_status(raw_average)
    assert_equal "Pass, you're doing it great Sam Tarly", status
  end

end
