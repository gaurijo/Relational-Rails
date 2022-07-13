require 'rails_helper'
#(story 13)
# When I click the link
# I am taken to '/schools/:school_id/students/new' where I see a form to add a new adoptable child

RSpec.describe 'the School Student creation' do 

   it 'links to a form to create a new student for that school' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
      student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)

      visit "/schools/#{school.id}/students"
      click_link "Create Student"

      expect(current_path).to eq("/schools/#{school.id}/students/new")
   end

# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

   # it 'creates a new student for that school' do 
   #    school = School.create!(name: "Lemonade High School", national_rank: 12, 
   #                               ap_program: true)
   #    student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      
   #    visit "/schools/#{school.id}/students/new"

   #    fill_in('Name', with: 'Martha')
   #    fill_in('Class rank', with: 4)
   #    fill_in('Honor roll', with: true)
   #    click_button "Create Student"

   #    expect(current_path).to eq("/schools/#{school.id}/students")
   # end
end