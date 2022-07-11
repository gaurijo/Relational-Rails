require 'rails_helper'

# When I click the link (story 14)
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

RSpec.describe 'the Student update' do 
   it 'links to a student edit page, populates a form to edit student attributes and redirects to updated students page with updated student visible' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
      student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)

      visit "/students/#{student.id}/edit"

      fill_in('Name', with: "Sandra")
      fill_in('Class rank', with: 1)
      fill_in('Honor roll', with: true)
      click_button('Update Student')

      expect(current_path).to eq("/students/#{student.id}")
      expect(page).to have_content("Sandra")
   end
end