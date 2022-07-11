require 'rails_helper'
# As a visitor
# When I visit a School Students Index page
# Then I see a link to add a new adoptable student for that school "Create Student"

RSpec.describe 'the School Student creation' do 
   it 'displays a link to add a new student' do
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                    ap_program: false)                          
      student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)
      
      visit "/schools/#{school.id}/students" 
      find_link('Create Student')

      expect(page).to have_content('Create Student')
   end
# When I click the link
# I am taken to '/schools/:school_id/students/new' where I see a form to add a new adoptable child

   it 'populates a form to create a new student for that school' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
      student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)

      visit "/schools/#{school.id}/students/new"

      click_button('Create Student')

      expect(current_path).to eq("/schools/#{school.id}/students")
   end
end