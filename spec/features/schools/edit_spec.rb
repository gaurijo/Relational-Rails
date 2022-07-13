require 'rails_helper'

RSpec.describe 'the School update' do 
   it 'displays a link to update the School' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
      visit "/schools/#{school.id}"

      find_link('Update School')

      expect(current_path).to eq("/schools/#{school.id}")
   end

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
      expect(page).to have_content("Lemon High School")
   end
end
