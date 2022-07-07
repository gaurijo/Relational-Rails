require 'rails_helper'

RSpec.describe 'the students show page' do 

# User Story 4, Student Show 
# As a visitor
# When I visit '/students/:id'
# Then I see the student with that id including the student's attributes: name, honor_roll,
# class_rank, school_id

   it 'displays the student name associated with the id' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                  ap_program: false)
      student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29) 

      visit "/students/#{student.id}"

      expect(page).to have_content(student.name)
      expect(page).to_not have_content(student_2.name)
   end

  it 'displays true/false depending on if the student is on the honor roll' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                ap_program: false)
      student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29) 
      student_3 = school.students.create!(name: "Sasha", honor_roll: false, class_rank: 100) 

      visit "/students/#{student.id}"

      expect(page).to have_content(student.honor_roll)
      expect(page).to_not have_content(student_3.honor_roll)
   end
   
   it 'displays the class rank' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                ap_program: false)
      student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29) 

      visit "/students/#{student.id}"

      expect(page).to have_content(student.class_rank)
      expect(page).to_not have_content(student_2.class_rank)
   end 

   it 'displays the school id associated with the student' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                ap_program: false)
      student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29) 

      visit "/students/#{student.id}"

      expect(page).to have_content(student.school_id)
      expect(page).to_not have_content(student_2.school_id)
   end 
end