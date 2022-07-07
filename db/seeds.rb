# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                  ap_program: false) 