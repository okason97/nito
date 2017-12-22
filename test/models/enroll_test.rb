require 'test_helper'

class EnrollTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should only asociate existing courses' do
    name = Faker::StarWars.character.split(' ')
    email = Faker::StarWars.specie + '@' + Faker::StarWars.planet + '.com'
    student = Student.create(
      last_name: name.last, first_name: name.first,
      email: email, legajo: (123456), dni: (39_831_178)
    )
    enroll = Enroll.new(course_id: 9999, student: student)
    assert_not enroll.save
  end

  test 'should only asociate existing students' do
    course = Course.create(year: 2000)
    enroll = Enroll.new(course: course, student_id: 999)
    assert_not enroll.save
  end
end
