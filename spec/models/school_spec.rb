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

    describe 'order_by_created_at_desc' do 
        it 'displays the school records ordered by most recently created first' do 
            school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
            school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                ap_program: false) 
            school_3 = School.create!(name: "Kiwi High School", national_rank: 210,
                                ap_program: false) 
                                
            expect(School.order(created_at: :desc)).to eq([school_3, school_2, school])
        end
    end

    describe 'count_students' do 
        it 'displays the number of students associated with that school' do 
            school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
            school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                ap_program: false) 
            school_3 = School.create!(name: "Kiwi High School", national_rank: 210,
                                ap_program: false) 
            student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
            student_2 = school.students.create!(name: "Ellen", honor_roll: true, class_rank: 29) 
                            
            expect(school.student_count).to eq(2)
        end
    end
end