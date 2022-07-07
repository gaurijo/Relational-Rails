require 'rails_helper'

RSpec.describe School, type: :model do
    describe 'instance methods' do   
        it 'returns the name of the school' do
         school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
         school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                  ap_program: false)
        
         expect(school.name).to eq("Lemonade High School")
         expect(school_2.name).to eq("Watermelon High School")
        end

        it 'has a national rank' do 
         school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
         school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                  ap_program: false)
        
        expect(school.national_rank).to eq(12)
        expect(school_2.national_rank).to eq(19)
       end

        it 'knows if it has an ap program' do 
         school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
         school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                  ap_program: false) 

        expect(school.ap_program?).to eq(true)
        expect(school_2.ap_program?).to eq(false)
        end

    end

    describe 'validations' do 
        it { should validate_presence_of(:name)}
        it { should validate_presence_of(:national_rank)}
        it { should allow_value(true). for(:ap_program)}
        it { should allow_value(false). for(:ap_program)}
    end
                
end