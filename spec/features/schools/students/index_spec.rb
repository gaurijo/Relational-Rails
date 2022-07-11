# User Story 5, School Students Index 

# As a visitor
# When I visit '/schools/:school_id/students'
# Then I see each Student that is associated with that School with each Student's attributes

require 'rails_helper'

RSpec.describe 'school students index' do 
   it 'shows all of the student names for the school' do
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                              ap_program: true)
      mira = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      rhonda = school.students.create!(name: "Rhonda", honor_roll: false, class_rank: 49)

      visit "/schools/#{school.id}/students"

      expect(page).to have_content(mira.name)
      expect(page).to have_content(rhonda.name)
   end

   it 'shows all of the student honor roll for the school' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                              ap_program: true)
      mira = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      rhonda = school.students.create!(name: "Rhonda", honor_roll: false, class_rank: 49)

      visit "/schools/#{school.id}/students"

      expect(page).to have_content(mira.honor_roll)
      expect(page).to have_content(rhonda.honor_roll)
   end

   it 'shows all of the student class rank status for the school' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                              ap_program: true)
      mira = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      rhonda = school.students.create!(name: "Rhonda", honor_roll: false, class_rank: 49)

      visit "/schools/#{school.id}/students"

      expect(page).to have_content(mira.class_rank)
      expect(page).to have_content(rhonda.class_rank)
   end

   it 'displays a link at the top of the page that takes user to the students index page' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                    ap_program: false)                          
      student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)
      
      visit "/schools/#{school.id}/students"
      click_link "Students"
      
      expect(page).to have_link("Students")
      expect(current_path).to eq('/students')
      
   end
#As a visitor (story 13)
#When I visit a Parent Childs Index page
#Then I see a link to add a new adoptable child for that parent "Create Child"
   it 'displays a link to add a new student for that school' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                    ap_program: false)                          
      student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)
   
      visit "/schools/#{school.id}/students"
      find_link "Create Student"

      expect(page).to have_link("Create Student")
   end
end