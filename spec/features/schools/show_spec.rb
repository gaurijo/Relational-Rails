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
      # expect(page).to_not have_content(school_2.national_rank)
   end

   it 'displays true if the school has an AP Program' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                              ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                              ap_program: false)           
      visit "/schools/#{school.id}"

      expect(page).to have_content(school.ap_program)
      expect(page).to_not have_content(school_2.ap_program)
   end

   it 'displays the count of the number of students associated with the school' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                              ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                              ap_program: false)
      school_3 = School.create!(name: "Kiwi High School", national_rank: 210,
                              ap_program: false)   
      student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      student_2 = school.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)   

      visit "/schools/#{school.id}"

      # within '#school-0' do 
      expect(page).to have_content("Students")
      
   end

   it 'displays a link at the top of the page that takes user to the students show page' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                    ap_program: false)                          
      
      visit "/schools/#{school.id}"
      click_link "Students"

      expect(page).to have_link("Students")
   end

   it 'displays a link at the top of the page that takes user to the schools index page' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                    ap_program: false)                          
      student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)
      
      visit "/schools/#{school.id}"
      click_link "Schools"
      
      expect(page).to have_link("Schools")
      expect(current_path).to eq('/schools')
      
   end

   it 'displays a link that takes user to the schools student page' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                    ap_program: false)                          
      student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)
      
      visit "/schools/#{school.id}"
      find_link "Roster"
      
      expect(page).to have_link("Roster")
      # expect(current_path).to eq("/schools/#{school.id}/students")
      
   end

   it 'displays a link to update the school page' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
   
      visit "/schools/#{school.id}"
      find_link "Update School"

      expect(page).to have_link("Update School")
   end

# User story 19 - When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent

   it 'displays a link to delete the school from that school show page' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)

      visit "/schools/#{school.id}"
      find_link "Delete School"

      expect(page).to have_link("Delete School")
   end

   it 'deletes the school' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
      
      visit "/schools/#{school.id}"
      click_link "Delete School"

      expect(current_path).to eq("/schools")
   end

end
      

      
   