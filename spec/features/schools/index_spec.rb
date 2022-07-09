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
      school_3 = School.create!(name: "Kiwi High School", national_rank: 210,
                              ap_program: false) 

      visit '/schools'
      # save_and_open_page

      within '#school-0' do 
         expect(page).to have_content("Kiwi High School")
      end

      within '#school-1' do 
         expect(page).to have_content("Watermelon High School")
      end

      within '#school-2' do 
         expect(page).to have_content("Lemonade High School")
      end
   end

   it 'displays next to the school record when the school record was created_at' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                              ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                              ap_program: false) 
      school_3 = School.create!(name: "Kiwi High School", national_rank: 210,
                              ap_program: false) 
      visit '/schools'

      expect(page).to have_content(school.created_at)
      # expect(page).to_not have_content(school.national_rank)
   end

   it 'displays a link at the top of the page that takes user to the students index page' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                    ap_program: false)                          
      student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)
      
      visit '/schools'
      click_link "Students"
      
      expect(page).to have_link("Students")
      expect(current_path).to eq('/students')
      
   end
   
end