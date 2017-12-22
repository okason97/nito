require 'test_helper'

class TestCourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should only asociate existing tests' do
    course = Course.create(year: 2000)
    test_course = TestCourse.new(test_id: 9999, course: course)
    assert_not test_course.save
  end

  test 'should only asociate existing students' do
    test = Test.create(title: 'title', date: Time.zone.today, min_score: 5, max_score: 10)
    test_course = TestCourse.new(test: test, course_id: 999)
    assert_not test_course.save
  end
end
