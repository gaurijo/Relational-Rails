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

   it 'displays a link to edit each student info' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                              ap_program: true)
      mandy = school.students.create!(name: "Mandy", honor_roll: true, class_rank: 4)
      noah = school.students.create!(name: "Noah", honor_roll: false, class_rank: 29) 

      visit "/schools/#{school.id}/students"
      find_link("Update Student", match: :first)

      expect(page).to have_link("Update Student")
      expect(current_path).to eq("/schools/#{school.id}/students")
   end

   it 'links to the students edit page' do 
      monta = School.create!(name: "Monta Vista High School", national_rank: 12, 
                              ap_program: true)
      mandy = monta.students.create!(name: "Mandy", honor_roll: true, class_rank: 4)

      visit "/schools/#{monta.id}/students"
      click_link "Update Student"

      expect(current_path).to eq("/students/#{mandy.id}/edit")
   end

   it 'displays a link to delete each student' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                              ap_program: true)
      mandy = school.students.create!(name: "Mandy", honor_roll: true, class_rank: 4)
      noah = school.students.create!(name: "Noah", honor_roll: false, class_rank: 29) 

      visit "/schools/#{school.id}/students"
      find_link("Delete Student", match: :first)

      expect(page).to have_link("Delete Student")
   end

   it 'displays a form that allows the user to input a numerical value' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                              ap_program: true)
      school_2 = School.create!(name: "Solar High School", national_rank: 80,
                              ap_program: false)
      mandy = school.students.create!(name: "Mandy", honor_roll: true, class_rank: 4)
      noah = school.students.create!(name: "Noah", honor_roll: false, class_rank: 29)
      lucas = school_2.students.create!(name: "Lucas", honor_roll: true, class_rank: 1)

      visit "/schools/#{school.id}/students"

      fill_in("schools_with_more_than", with: 2)
      click_button("Find Schools")

      expect(page).to have_button("Find Schools")
   end
end