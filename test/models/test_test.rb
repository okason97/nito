require 'test_helper'

class TestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should not save with no title' do
    test = Test.create(date: Time.zone.today, min_score: 5, max_score: 10)
    assert_not test.save
  end

  test 'should not save with no date' do
    test = Test.create(title: 'title',  min_score: 5, max_score: 10)
    assert_not test.save
  end

  test 'should not save with no max score' do
    test = Test.create(title: 'title', date: Time.zone.today, min_score: 5)
    assert_not test.save
  end

  test 'should not save if max_score < min_score' do
    test = Test.create(title: 'title', date: Time.zone.today, min_score: 5, max_score: 2)
    assert_not test.save
  end
  test 'should return the ammount of passed students' do
    test = Test.create(title: 'title', date: Time.zone.today, min_score: 5, max_score: 10)
    name = Faker::StarWars.character.split(' ')
    email = Faker::StarWars.specie + '@' + Faker::StarWars.planet + '.com'
    Score.create(
      student: Student.new(
        last_name: name.last, first_name: name.first,
        email: email, legajo: (123456), dni: 45258154
      ), test_id: test.id, value: 7  
    )
    assert test.pass == 1
  end
  test 'should return the ammount of failed students' do
    test = Test.create(title: 'title', date: Time.zone.today, min_score: 5, max_score: 10)
    name = Faker::StarWars.character.split(' ')
    email = Faker::StarWars.specie + '@' + Faker::StarWars.planet + '.com'
    Score.create(
      student: Student.new(
        last_name: name.last, first_name: name.first,
        email: email, legajo: (123456), dni: 45258154
      ), test_id: test.id, value: 1
    )
    assert test.fail == 1
  end
  test 'should return the ammount of absent students' do
    test = Test.create(title: 'title', date: Time.zone.today, min_score: 5, max_score: 10)
    name = Faker::StarWars.character.split(' ')
    email = Faker::StarWars.specie + '@' + Faker::StarWars.planet + '.com'
    Score.create(
      student: Student.new(
        last_name: name.last, first_name: name.first,
        email: email, legajo: (123456), dni: 45258154
      ), test_id: test.id, value: -2
    )
    assert test.absent == 1
  end
  test 'should return the percentage of passed students' do
    test = Test.create(title: 'title', date: Time.zone.today, min_score: 5, max_score: 10)
    name = Faker::StarWars.character.split(' ')
    email = Faker::StarWars.specie + '@' + Faker::StarWars.planet + '.com'
    Score.create(
      student: Student.new(
        last_name: name.last, first_name: name.first,
        email: email, legajo: (123456), dni: 45258154
      ), test_id: test.id, value: 7
    )
    assert test.percentage == '100%', test.percentage
  end
end
