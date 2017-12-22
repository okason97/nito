# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Course.create year: Time.zone.today.year
Course.create year: (Time.zone.today.year - 1)

Course.all.each do |course|
    4.times do |i|
        title = "Examen #{i}"
        date = Time.zone.today.change(year: course.year) + i.days
        max_score = rand(10..15)
        min_score = (max_score * 0.7).round
        TestCourse.create(
            course: course, 
            test: Test.create(title: title, date: date, min_score: min_score, max_score: max_score)
        )
    end
end

10.times do |i|
    name = Faker::StarWars.character.split(' ')
    email = Faker::StarWars.specie + '@' + Faker::StarWars.planet + '.com'
    Enroll.create(
        student: 
            Student.create(
                last_name: name.last, first_name: name.first,
                email: email, legajo: (123456 + i), dni: (39_831_178 + i)
            ),
        course: Course.order("RANDOM()").first     
    )
end

Test.all.each do |test|
    Enroll.where(course_id: TestCourse.find_by(test: test).course_id).each do |enroll|
        if (rand > 0.5)
            value = rand((test.max_score + 1))
            Score.create( student_id: enroll.student_id, test: test, value: value)
        else
            Score.create( student_id: enroll.student_id, test: test, value: -2)
        end
    end
end