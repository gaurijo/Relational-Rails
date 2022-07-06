require 'rails_helper'

RSpec.describe 'the schools show page' do 
# User Story 2, School Show 
# As a visitor
# When I visit '/schools/:id'
# Then I see the school with that id including the school's attributes:
# - data from each column that is on the parent table (name, national_rank,
#ap_program)

   it 'displays the school name with the associated id' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                  ap_program: false)           
      visit "/schools/#{school.id}"

      expect(page).to have_content(school.name)
      expect(page).to_not have_content(school_2.name)
   end

   it 'displays the national rank of the school' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                  ap_program: false)           
      visit "/schools/#{school.id}"
      # save_and_open_page
      expect(page).to have_content(school.national_rank)
      expect(page).to_not have_content(school_2.national_rank)
   end

   it 'displays true if the school has an AP Program' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                  ap_program: false)           
      visit "/schools/#{school.id}"
      save_and_open_page

      expect(page).to have_content(school.ap_program)
      expect(page).to_not have_content(school_2.ap_program)
   end
end
      

      
   # it 'displays if the school has an ap program'