require 'rails_helper' 

RSpec.describe 'the school index page' do 
   it 'displays the name of each school' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                              ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                              ap_program: false) 
   
      visit '/schools' 

      expect(page).to have_content(school.name)
      expect(page).to have_content(school_2.name)
   end

   it 'orders index by most recently created first' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                              ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                              ap_program: false) 
      school_3 = School.create!(name: "Kiwi High School", national_rank: 210,
                              ap_program: false) 

      visit '/schools'

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
      expect(page).to_not have_content("National rank")
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

      it 'displays a link at the top of the page that takes user to the schools index page' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
      school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                    ap_program: false)                          
      student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)
      
      visit '/schools'
      click_link "Schools"
      
      expect(page).to have_link("Schools")
      expect(current_path).to eq('/schools')
      
   end

   it 'displays a link to edit the schools info next to every school record' do 
      monta = School.create!(name: "Monta Vista High School", national_rank: 12, 
                                 ap_program: true)
         
      visit '/schools'
      find_link "Update School"

      expect(page).to have_link("Update School")
   end

   it 'links to the schools edit page' do 
      monta = School.create!(name: "Monta Vista High School", national_rank: 12, 
                                 ap_program: true)
      visit '/schools'
      click_link "Update School"

      expect(current_path).to eq("/schools/#{monta.id}/edit")
   end

   it 'displays a link to delete the schools info next to every school record' do 
      monta = School.create!(name: "Monta Vista High School", national_rank: 12, 
                                 ap_program: true)
         
      visit '/schools'
      find_link "Delete School"

      expect(page).to have_link("Delete School")
   end
end