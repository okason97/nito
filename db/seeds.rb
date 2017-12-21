# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Teacher.create(username: 'admin', password: 'pass')

Course.create year: Time.zone.today.year
Course.create year: (Time.zone.today.year - 1)

Course.all.each do |course|
    4.times do |i|
        title = "Examen #{i}"
        date = Time.zone.today.change(year: course.year) + i.days
        max_score = rand(10..15)
        min_score = (max_score * 0.7).round
        TestCourse.create(
            course_id: course, 
            test_id: Test.create(title: title, date: date, min_score: min_score, max_score: max_score)
        )
    end
end

Test.all.each do |test|
    Student.order("RANDOM()").first(7) do |student|
        value = rand(exam.max_score + 1)
        Score.create(value: value, student_id: student, test_id: test)
    end
end

10.times do |i|
    name = Faker::StarWars.character.split(' ')
    email = Faker::StarWars.specie + '@' + Faker::StarWars.planet + '.com'
    Enroll.create(
        student_id: 
            Student.create(
                last_name: name.last, first_name: name.first,
                email: email, legajo: (123456 + i), dni: (39_831_178 + i)
            ),
        course_id: Course.order("RANDOM()").first     
    )
end