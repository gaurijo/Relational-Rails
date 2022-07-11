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

      expect(current_path).to eq("/schools/:school_id/students/new")
   end
end