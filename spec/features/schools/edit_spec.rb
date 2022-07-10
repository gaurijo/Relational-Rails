
# As a visitor
# When I visit a school show page
# Then I see a link to update the parent "Update school"
require 'rails_helper'

RSpec.describe 'the School update' do 
   it 'displays a link to update the School' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
      visit "/schools/#{school.id}"

      find_link('Update School')

      expect(current_path).to eq("/schools/#{school.id}")
   end

# When I click the link "Update school"
# Then I am taken to '/schools/:id/edit' where I  see a form to edit the school's attributes:

   it 'populates a form to edit the school attributes: name, national_rank, ap_program' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)

      visit "/schools/#{school.id}"

      click_link('Update School')

      expect(current_path).to eq("/schools/#{school.id}/edit")
   end

   it 'updates a school record and redirects to the school show page where the updated record is displayed' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)

      visit "/schools/#{school.id}/edit"

      fill_in('Name', with: "Lemon High School")
      fill_in('National rank', with: 99)
      fill_in('Ap program', with: false)
      click_on('Submit')

      expect(current_path).to eq("/schools/#{school.id}")

   end
end
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/schools/:id',
# the school's info is updated,
# and I am redirected to the school's Show page where I see the school's updated info
