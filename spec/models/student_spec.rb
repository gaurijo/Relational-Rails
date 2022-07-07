require 'rails_helper'

describe Student, type: :model do 
   describe "validations" do 
      it { should validate_presence_of :name}
      it { should validate_presence_of :class_rank}
      it { should allow_value(true). for(:honor_roll)}
      it { should allow_value(false). for(:honor_roll)}
   end
end
      
