require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should not save with no dni set' do
    name = Faker::StarWars.character.split(' ')
    email = Faker::StarWars.specie + '@' + Faker::StarWars.planet + '.com'
    student = Student.new(
      last_name: name.last, first_name: name.first,
      email: email, legajo: (123456)
    )
    assert_not student.save
  end

  test 'should not save with no legajo set' do
    name = Faker::StarWars.character.split(' ')
    email = Faker::StarWars.specie + '@' + Faker::StarWars.planet + '.com'
    student = Student.new(
      last_name: name.last, first_name: name.first,
      email: email, dni: (39_831_178)
    )
    assert_not student.save
  end

  test 'should not save with no email set' do
    name = Faker::StarWars.character.split(' ')
    email = Faker::StarWars.specie + '@' + Faker::StarWars.planet + '.com'
    student = Student.new(
      last_name: name.last, first_name: name.first,
      legajo: (123456), dni: (39_831_178)
    )
    assert_not student.save
  end

  test 'should not save with no first_name set' do
    name = Faker::StarWars.character.split(' ')
    email = Faker::StarWars.specie + '@' + Faker::StarWars.planet + '.com'
    student = Student.new(
      last_name: name.last,
      email: email, legajo: (123456), dni: (39_831_178)
    )
    assert_not student.save
  end
  test 'should not save with no last name set' do
    name = Faker::StarWars.character.split(' ')
    email = Faker::StarWars.specie + '@' + Faker::StarWars.planet + '.com'
    student = Student.new(
      first_name: name.first,
      email: email, legajo: (123456), dni: (39_831_178)
    )
    assert_not student.save
  end
  test 'should not save with an invalid email' do
    name = Faker::StarWars.character.split(' ')
    student = Student.new(
      last_name: name.last, first_name: name.first,
      email: "123456", legajo: (123456), dni: (39_831_178)
    )
    assert_not student.save
  end
  test 'should not save with a non numeric dni' do
    name = Faker::StarWars.character.split(' ')
    email = Faker::StarWars.specie + '@' + Faker::StarWars.planet + '.com'
    student = Student.new(
      last_name: name.last, first_name: name.first,
      email: email, legajo: (123456), dni: "a39_831_178"
    )
    assert_not student.save
  end
  test 'should not save with a non numeric legajo' do
    name = Faker::StarWars.character.split(' ')
    email = Faker::StarWars.specie + '@' + Faker::StarWars.planet + '.com'
    student = Student.new(
      last_name: name.last, first_name: name.first,
      email: email, legajo: ("a123456"), dni: 39_831_178
    )
    assert_not student.save
  end
end