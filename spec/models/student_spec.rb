require 'rails_helper'

describe Student, type: :model do 
   describe "validations" do 
      it { should validate_presence_of :name}
      it { should validate_presence_of :class_rank}
      it { should allow_value(true). for(:honor_roll)}
      it { should allow_value(false). for(:honor_roll)}
   end

   describe "relationships" do 
      it { should belong_to :school}
   end

   describe "true records" do 
      it 'only displays the student records for students who are on the honor roll' do 
         school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
         mandy = school.students.create!(name: "Mandy", honor_roll: true, class_rank: 4)
         noah = school.students.create!(name: "Noah", honor_roll: false, class_rank: 29)

         expect(Student.where(honor_roll: true)).to eq([mandy])
      end
   end

   describe "ordered alphabaetically" do 
      it 'returns students ordered alphabetically' do 
         school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                 ap_program: true)
         mandy = school.students.create!(name: "Mandy", honor_roll: true, class_rank: 4)
         noah = school.students.create!(name: "Noah", honor_roll: false, class_rank: 29)

         expect(Student.order(:name)).to eq([mandy, noah])
      end
   end
end
      
