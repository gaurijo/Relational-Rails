require 'rails_helper'

RSpec.describe 'the School Student creation' do 

   it 'links to a form to create a new student for that school' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)

      visit "/schools/#{school.id}/students"
      click_link "Create Student"

      expect(current_path).to eq("/schools/#{school.id}/students/new")
   end

   it 'creates a new student for that school' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
      
      visit "/schools/#{school.id}/students/new"

      fill_in('Name', with: 'Martha')
      fill_in('Class rank', with: 4)
      fill_in('Honor roll', with: true)
      click_button "Create Student"

      expect(current_path).to eq("/schools/#{school.id}/students")
   end
end