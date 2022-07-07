# User Story 5, School Students Index 

# As a visitor
# When I visit '/schools/:school_id/students'
# Then I see each Student that is associated with that School with each Student's attributes

require 'rails_helper'

RSpec.describe 'school students index' do 
   it 'shows all of the student names for the school' do
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
      mira = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      rhonda = school.students.create!(name: "Rhonda", honor_roll: false, class_rank: 49)

      visit "/schools/#{school.id}/students"

      expect(page).to have_content(mira.name)
      expect(page).to have_content(rhonda.name)
   end

   it 'shows all of the student honor roll for the school' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
      mira = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      rhonda = school.students.create!(name: "Rhonda", honor_roll: false, class_rank: 49)

      visit "/schools/#{school.id}/students"

      expect(page).to have_content(mira.honor_roll)
      expect(page).to have_content(rhonda.honor_roll)
   end

   it 'shows all of the student class rank status for the school' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
      mira = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
      rhonda = school.students.create!(name: "Rhonda", honor_roll: false, class_rank: 49)

      visit "/schools/#{school.id}/students"

      expect(page).to have_content(mira.class_rank)
      expect(page).to have_content(rhonda.class_rank)
   end
end