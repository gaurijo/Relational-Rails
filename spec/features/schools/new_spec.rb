require 'rails_helper'

RSpec.describe 'New School' do 
   it 'displays a link to the new page from the schools index' do 
      visit '/schools'

      click_link("New School")

      expect(current_path).to eq('/schools/new')

      # fill_in 'Name', with: 'Mango High School'
      
      # expect(current_path).to eq('/schools/new')
      expect(page).to have_content('Name')
      expect(page).to have_content('National rank')
      
   end

   it 'can create a new school' do 
      visit '/schools/new'

      fill_in('Name', with: "Mango High School")
      fill_in('National rank', with: 89)
      fill_in('Ap program', with: true)
      click_on("Create New School")

      # new_school_id = School.last.id
      expect(current_path).to eq("/schools")
      expect(page).to have_content("Mango High School")
   end
end