require 'rails_helper'

RSpec.describe School, type: :model do
    describe 'validations' do 
        it { should validate_presence_of(:name)}
        it { should validate_presence_of(:national_rank)}
        it { should allow_value(true). for(:ap_program)}
        it { should allow_value(false). for(:ap_program)}
    end 
    
    describe 'relationships' do 
        it { should have_many :students}
    end

    describe 'order' do 
        it 'displays the school records ordered by most recently created first' do 
            school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
            school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                ap_program: false) 
            expect(School.order("created_at asc")).to eq([school, school_2])
        end
    end
end