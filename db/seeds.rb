# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.destroy_all
School.destroy_all

school = School.create!(name: "Lemonade High School", national_rank: 12, 
                              ap_program: true)
school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                              ap_program: false)
school_3 = School.create!(name: "Kiwi High School", national_rank: 210,
                              ap_program: false)
School.create!(name: "Plum High School", national_rank: 43, ap_program: true)
School.create!(name: "Blueberry High School", national_rank: 123, ap_program: false)


student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)
Student.create!(name: "Ernie", honor_roll: true, class_rank: 18, school_id: 20)
Student.create!(name: "Bert", honor_roll: true, class_rank: 8, school_id: 20)
Student.create!(name: "Aisha", honor_roll: true, class_rank: 48, school_id: 17)
Student.create!(name: "Juan", honor_roll: true, class_rank: 1, school_id: 24)
Student.create!(name: "Naya", honor_roll: true, class_rank: 21, school_id: 22)
Student.create!(name: "Beth", honor_roll: false, class_rank: 61, school_id: 22)
Student.create!(name: "Taylor", honor_roll: true, class_rank: 11, school_id: 20)
