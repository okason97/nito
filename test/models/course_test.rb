require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should not save course without year' do
    course = Course.new
    assert_not course.save, "saved without a year"
  end

  test 'should not save with a year < 1900' do
    course = Course.new(year: 1800)
    assert_not course.save
  end

  test 'should not save with a year > 2100' do
    course = Course.new(year: 2500)
    assert_not course.save
  end

  test 'should not save with a year that is not a number' do
    course = Course.new(year: 'dosmil')
    assert_not course.save
  end

  test 'should not save with a year that is not a integer' do
    course = Course.new(year: 2000.5)
    assert_not course.save
  end

  test 'should not save repeated course years' do
    course = Course.create(year: 2000)
    course = Course.new(year: 2000)
    assert_not course.save
  end
end