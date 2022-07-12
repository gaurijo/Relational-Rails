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

#User Story 16, Sort Parent's Children in Alphabetical Order by name 
# As a visitor
# When I visit the Parent's children Index Page
# Then I see a link to sort children in alphabetical order 

   it 'displays a link to sort students in alphabetical order' do 
         school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                    ap_program: false)                          
      student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)
   
      visit "/schools/#{school.id}/students"
      find_link "Sort Alphabetically"

      expect(page).to have_link("Sort Alphabetically")
   end

   # us 18
   # When I visit the `child_table_name` index page
   # Next to every child, I see a link to edit that child's info

   it 'displays a link to edit each student info' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                              ap_program: true)
      mandy = school.students.create!(name: "Mandy", honor_roll: true, class_rank: 4)
      noah = school.students.create!(name: "Noah", honor_roll: false, class_rank: 29) 

      visit "/schools/#{school.id}/students"
      find_link("Update Student", match: :first)

      expect(page).to have_link("Update Student")
      # expect(current_path).to eq("/students/#{mandy.id}/edit")
   end

   it 'links to the students edit page' do 
      monta = School.create!(name: "Monta Vista High School", national_rank: 12, 
                              ap_program: true)
      mandy = monta.students.create!(name: "Mandy", honor_roll: true, class_rank: 4)

      visit "/schools/#{monta.id}/students"
      click_link "Update Student"

      expect(current_path).to eq("/students/#{mandy.id}/edit")
   end
end