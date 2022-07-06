require 'rails_helper'

RSpec.describe School, type: :model do  

# User Story 1, School Index 

# For each school table
# As a visitor
# When I visit '/schools'
# Then I see the name of each school record in the system

    it 'returns the names of all schools' do
         school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
         school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                  ap_program: false)
        
         expect(school.name).to eq("Lemonade High School")
         expect(school_2.name).to eq("Watermelon High School")
    end

                
end