require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should not save with no value set' do
    name = Faker::StarWars.character.split(' ')
    email = Faker::StarWars.specie + '@' + Faker::StarWars.planet + '.com'
    student = Student.create(
      last_name: name.last, first_name: name.first,
      email: email, legajo: (123456), dni: (39_831_178)
    )
    test = Test.create(title: 'title', date: Time.zone.today, min_score: 5, max_score: 10)
    score = Score.new(test: test, student: student)
    assert_not score.save
  end

  test 'should only asociate existing tests' do
    name = Faker::StarWars.character.split(' ')
    email = Faker::StarWars.specie + '@' + Faker::StarWars.planet + '.com'
    student = Student.create(
      last_name: name.last, first_name: name.first,
      email: email, legajo: (123456), dni: (39_831_178)
    )
    score = Score.new(test_id: 9999, student: student)
    assert_not score.save
  end

  test 'should only asociate existing students' do
    test = Test.create(title: 'title', date: Time.zone.today, min_score: 5, max_score: 10)
    score = Score.new(test: test, student_id: 999)
    assert_not score.save
  end
end
