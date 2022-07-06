require 'rails_helper'

RSpec.describe 'the schools show page' do 
   it 'displays the school name' do 
      school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
      visit "/schools/#{school.id}"
   end

   it 'displays the national rank of the school'
   it 'displays if the school has an ap program'
end