require 'rails_helper' 

RSpec.describe 'the school index page' do 

# User Story 1, School Index 
# For each school table
# As a visitor
# When I visit '/schools'
# Then I see the name of each school record in the system

   it 'displays the name of each school' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                              ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                              ap_program: false) 
   
      visit '/schools' 

      expect(page).to have_content(school.name)
      expect(page).to have_content(school_2.name)
      expect(page).to_not have_content(school.national_rank)
   end

# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created

   it 'orders index by most recently created first' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                              ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                              ap_program: false) 

      visit '/schools'

      within '#school-0' do 
         expect(page).to have_content("Watermelon High School")
      end

      within '#school-1' do 
         expect(page).to have_content("Lemonade High School")
      end
   end

   it 'displays when the school record was created_at' 
   
end